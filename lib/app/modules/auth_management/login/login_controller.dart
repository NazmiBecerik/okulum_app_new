// lib/app/modules/auth_management/login/login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/storage/custom_storage_service.dart';
import '../../../../core/services/storage/storage_key_enums.dart';
import '../../../../core/utils/getx_extensions.dart';
import '../../../../core/utils/utils.dart';
import '../../../models/auth_models/request_models/phone_login_request_model.dart';
import '../../../models/auth_models/request_models/password_login_request_model.dart';
import '../../../models/auth_models/request_models/student_login_request_model.dart';
import '../../../models/student/student_model.dart';
import '../../../repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';
import '../../common/controllers/user_controller.dart';

enum LoginStep { Phone, Password, Student }

enum LoginState { Initial, Busy, Loaded, Error }

class LoginController extends GetxController {
  AuthRepository authRepository = Get.find<AuthRepository>();
  UserController userController = Get.find<UserController>();
  CustomStorageService storageService = Get.find<CustomStorageService>();

  final Rx<LoginState> _state = LoginState.Initial.obs;
  LoginState get state => _state.value;
  set state(LoginState value) => _state.value = value;

  final Rx<LoginStep> _currentStep = LoginStep.Phone.obs;
  LoginStep get currentStep => _currentStep.value;
  set currentStep(LoginStep value) => _currentStep.value = value;

  final Rx<bool> _rememberMe = false.obs;
  bool get rememberMe => _rememberMe.value;
  set rememberMe(bool value) => _rememberMe.value = value;

  // Form keys
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  // Form data
  String phone = "";
  String password = "";
  String secret = "";
  bool isFirstLogin = false;
  String loginMessage = "";
  List<Student> availableStudents = [];
  Student? selectedStudent;

  @override
  void onInit() {
    ever(_state, (LoginState value) {
      switch (value) {
        case LoginState.Busy:
          Get.showProgressDialog();
          break;
        case LoginState.Loaded:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        case LoginState.Error:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        default:
      }
    });
    super.onInit();

    // Kayıtlı bilgileri kontrol et
    _checkSavedCredentials();
  }

  /// 1. Adım: Telefon numarası kontrolü
  Future<void> phoneLogin() async {
    if (phoneFormKey.currentState?.validate() ?? false) {
      phoneFormKey.currentState?.save();

      await errorHandler(
        tryMethod: () async {
          state = LoginState.Busy;

          final request = PhoneLoginRequest(phone: phone);
          final result = await authRepository.phoneLogin(request: request);

          if (result != null && result.isSuccess) {
            isFirstLogin = result.data?.isFirstLogin ?? false;
            loginMessage = result.data?.message ?? "";

            if (isFirstLogin) {
              // İlk girişse direkt şifre adımına geç
              currentStep = LoginStep.Password;
            } else {
              // Kayıtlı kullanıcıysa şifre adımına geç
              currentStep = LoginStep.Password;
            }
            state = LoginState.Loaded;
          } else {
            Get.showErrorDialog("Telefon numarası bulunamadı!");
            state = LoginState.Error;
          }
        },
        onErr: (e) async {
          Get.showErrorDialog("Giriş sırasında bir hata oluştu!");
          state = LoginState.Error;
        },
      );
    }
  }

  /// 2. Adım: Şifre kontrolü
  Future<void> passwordLogin() async {
    if (passwordFormKey.currentState?.validate() ?? false) {
      passwordFormKey.currentState?.save();

      await errorHandler(
        tryMethod: () async {
          state = LoginState.Busy;

          final request = PasswordLoginRequest(phone: phone, password: password);
          final result = await authRepository.passwordLogin(request: request);

          if (result != null && result.isSuccess) {
            secret = result.data?.secret ?? "";
            availableStudents = result.data?.students ?? [];

            if (availableStudents.length == 1) {
              // Tek öğrenci varsa direkt seç
              selectedStudent = availableStudents.first;
              await studentLogin();
            } else if (availableStudents.length > 1) {
              // Birden fazla öğrenci varsa seçim ekranına geç
              currentStep = LoginStep.Student;
              state = LoginState.Loaded;
            } else {
              Get.showErrorDialog("Bu hesaba bağlı öğrenci bulunamadı!");
              state = LoginState.Error;
            }
          } else {
            Get.showErrorDialog("Şifre hatalı!");
            state = LoginState.Error;
          }
        },
        onErr: (e) async {
          Get.showErrorDialog("Şifre kontrolü sırasında bir hata oluştu!");
          state = LoginState.Error;
        },
      );
    }
  }

  /// 3. Adım: Öğrenci seçimi ve final login
  Future<void> studentLogin() async {
    if (selectedStudent == null) {
      Get.showErrorDialog("Lütfen bir öğrenci seçiniz!");
      return;
    }

    await errorHandler(
      tryMethod: () async {
        state = LoginState.Busy;

        final request = StudentLoginRequest(secret: secret, studentId: selectedStudent!.id);
        final result = await authRepository.studentLogin(request: request);

        if (result != null && result.isSuccess) {
          // Token'ı kaydet
          final token = result.data?.token ?? "";
          authRepository.setAuthToken(token);

          // Kullanıcı bilgilerini kaydet
          userController.setUserData(result.data!);

          // Remember me kontrolü
          if (rememberMe) {
            await _saveCredentials();
          }

          state = LoginState.Loaded;
          Get.offAndToNamed(AppRoutes.home.path);
        } else {
          Get.showErrorDialog("Öğrenci girişi başarısız!");
          state = LoginState.Error;
        }
      },
      onErr: (e) async {
        Get.showErrorDialog("Öğrenci girişi sırasında bir hata oluştu!");
        state = LoginState.Error;
      },
    );
  }

  /// Öğrenci seçimi
  void selectStudent(Student student) {
    selectedStudent = student;
    update();
  }

  /// Önceki adıma geri dön
  void goBack() {
    switch (currentStep) {
      case LoginStep.Password:
        currentStep = LoginStep.Phone;
        break;
      case LoginStep.Student:
        currentStep = LoginStep.Password;
        break;
      default:
        break;
    }
  }

  /// Giriş bilgilerini kaydet
  Future<void> _saveCredentials() async {
    await storageService.write(StorageKeys.phone.name, phone);
    await storageService.write(StorageKeys.password.name, password);
    await storageService.write(StorageKeys.rememberMe.name, rememberMe);
  }

  /// Kayıtlı giriş bilgilerini kontrol et
  void _checkSavedCredentials() {
    final savedRememberMe = storageService.read<bool>(StorageKeys.rememberMe.name) ?? false;
    if (savedRememberMe) {
      phone = storageService.read<String>(StorageKeys.phone.name) ?? "";
      password = storageService.read<String>(StorageKeys.password.name) ?? "";
      rememberMe = savedRememberMe;

      if (phone.isNotEmpty && password.isNotEmpty) {
        // Otomatik giriş yap
        Future.delayed(Duration(milliseconds: 500), () async {
          await phoneLogin();
          if (currentStep == LoginStep.Password) {
            await passwordLogin();
          }
        });
      }
    }
  }

  /// Form temizle
  void clearForm() {
    phone = "";
    password = "";
    secret = "";
    isFirstLogin = false;
    loginMessage = "";
    availableStudents.clear();
    selectedStudent = null;
    currentStep = LoginStep.Phone;
    state = LoginState.Initial;
  }
}
