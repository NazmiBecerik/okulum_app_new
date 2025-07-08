import 'package:get/get.dart';

import '../../../../core/services/storage/custom_storage_service.dart';
import '../../../../core/services/storage/storage_key_enums.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/locales.g.dart';
import '../../../models/auth_models/request_models/phone_login_request_model.dart';
import '../../../repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';
import '../../common/controllers/user_controller.dart';

class SplashController extends GetxController {
  final customStorageService = Get.find<CustomStorageService>();
  final userController = Get.find<UserController>();
  AuthRepository authRepository = Get.find<AuthRepository>();

  String loading = LocaleKeys.common_loading.tr;
  @override
  void onReady() async {
    if (!(await checkSplashLogin())) Get.offAndToNamed(AppRoutes.login.path);
    super.onReady();
  }

  Future<bool> checkSplashLogin() async {
    return await errorHandler<bool>(
          tryMethod: () async {
            /*     bool? rememberMe = customStorageService.read(StorageKeys.rememberMe.name);
            if (!(rememberMe ?? false)) return false;
            String? email = customStorageService.read(StorageKeys.phone.name);
            String? password = customStorageService.read(StorageKeys.password.name);
            if (email == null || password == null) return false;
            final result = await authRepository.phoneLogin(request: PhoneLoginRequest(phone: email));
            if (result == null) return false;
            userController.setUserData(result.data);
            Get.offAndToNamed(AppRoutes.home.path);
            return true; */
          },
          onErr: (e) async => false,
        ) ??
        false;
  }
}
