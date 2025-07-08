// lib/app/modules/common/controllers/user_controller.dart

import 'package:get/get.dart';
import '../../../../core/services/storage/custom_storage_service.dart';
import '../../../../core/services/storage/storage_key_enums.dart';
import '../../../models/auth_models/response_models/student_login_response.dart';
import '../../../models/student/student_model.dart';
import '../../../models/user/user_model.dart';
import '../../../models/module/module_model.dart';
import '../../../repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';
import '../widgets/appbar/bottom_app_bar/bottom_app_bar_controller.dart';

class UserController extends GetxController {
  CustomStorageService storageService = Get.find<CustomStorageService>();
  AuthRepository authRepository = Get.find<AuthRepository>();
  BottomAppBarController bottomAppBarController = Get.find<BottomAppBarController>();

  // User data
  final Rx<User?> _currentUser = Rx<User?>(null);
  User? get currentUser => _currentUser.value;

  final Rx<Student?> _selectedStudent = Rx<Student?>(null);
  Student? get selectedStudent => _selectedStudent.value;

  final RxList<Student> _students = <Student>[].obs;
  List<Student> get students => _students;

  final RxList<Module> _userModules = <Module>[].obs;
  List<Module> get userModules => _userModules;

  final Rx<String> _authToken = "".obs;
  String get authToken => _authToken.value;

  // User info getters
  String get userName => selectedStudent?.name ?? currentUser?.userType ?? "Kullanıcı";
  String get userPhone => currentUser?.phone ?? "";
  String get userType => currentUser?.userType ?? "";
  bool get isParent => userType == "parent";
  bool get isStudent => userType == "student";
  bool get isTeacher => userType == "teacher";

  /// Set user data from login response
  void setUserData(StudentLoginData loginData) {
    _authToken.value = loginData.token;
    _currentUser.value = loginData.user;
    _selectedStudent.value = loginData.selectedStudent;
    _students.value = loginData.students;
    _userModules.value = loginData.module;

    // Token'ı network service'e set et
    authRepository.setAuthToken(loginData.token);

    // Storage'a kaydet
    _saveUserDataToStorage();
  }

  /// Change selected student
  void changeSelectedStudent(Student student) {
    _selectedStudent.value = student;
    // Storage'a kaydet
    storageService.write(StorageKeys.selectedStudentId.name, student.id);
  }

  /// Check if user has module access
  bool hasModuleAccess(String moduleName) {
    return userModules.any(
      (module) =>
          module.name.toLowerCase() == moduleName.toLowerCase() &&
          module.status == 1 &&
          module.licenses.any((license) => license.status == 1 && DateTime.tryParse(license.expiredAt)?.isAfter(DateTime.now()) == true),
    );
  }

  /// Get module by name
  Module? getModule(String moduleName) {
    try {
      return userModules.firstWhere((module) => module.name.toLowerCase() == moduleName.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  /// Save user data to storage
  Future<void> _saveUserDataToStorage() async {
    if (currentUser != null) {
      await storageService.writeModel(StorageKeys.currentUser, currentUser!.toJson());
    }
    if (selectedStudent != null) {
      await storageService.writeModel(StorageKeys.selectedStudent, selectedStudent!.toJson());
      await storageService.write(StorageKeys.selectedStudentId.name, selectedStudent!.id);
    }
    await storageService.write(StorageKeys.authToken.name, authToken);
  }

  /// Load user data from storage
  Future<void> loadUserDataFromStorage() async {
    // Load user
    final userData = storageService.readModel<Map<String, dynamic>, User>(key: StorageKeys.currentUser, parseModel: User.fromJson({}));
    if (userData != null) {
      _currentUser.value = User.fromJson(userData);
    }

    // Load selected student
    final studentData = storageService.readModel<Map<String, dynamic>, Student>(key: StorageKeys.selectedStudent, parseModel: Student.fromJson({}));
    if (studentData != null) {
      _selectedStudent.value = Student.fromJson(studentData);
    }

    // Load token
    final token = storageService.read<String>(StorageKeys.authToken.name);
    if (token != null && token.isNotEmpty) {
      _authToken.value = token;
      authRepository.setAuthToken(token);
    }
  }

  /// Check if user is logged in
  bool get isLoggedIn => authToken.isNotEmpty && currentUser != null;

  /// Logout user
  Future<void> logOut() async {
    // Clear data
    _currentUser.value = null;
    _selectedStudent.value = null;
    _students.clear();
    _userModules.clear();
    _authToken.value = "";

    // Clear storage
    await storageService.remove(StorageKeys.currentUser.name);
    await storageService.remove(StorageKeys.selectedStudent.name);
    await storageService.remove(StorageKeys.selectedStudentId.name);
    await storageService.remove(StorageKeys.authToken.name);
    await storageService.remove(StorageKeys.phone.name);
    await storageService.remove(StorageKeys.password.name);
    await storageService.remove(StorageKeys.rememberMe.name);

    // Clear network token
    authRepository.logout();

    // Reset bottom navigation
    bottomAppBarController.changeTabIndex(index: 0);
    bottomAppBarController.lastDashboardPage = AppRoutes.home.path;

    // Navigate to login
    Get.offAndToNamed(AppRoutes.login.path);
  }

  @override
  void onInit() {
    super.onInit();
    // Load saved user data
    loadUserDataFromStorage();
  }
}
