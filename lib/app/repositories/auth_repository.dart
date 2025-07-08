// lib/app/repositories/auth_repository.dart

import 'package:get/get.dart';
import 'package:okulum_app/app/models/auth_models/request_models/password_login_request_model.dart';
import 'package:okulum_app/app/models/auth_models/request_models/phone_login_request_model.dart';
import 'package:okulum_app/app/models/auth_models/request_models/student_login_request_model.dart';
import 'package:okulum_app/app/models/auth_models/response_models/password_login_response.dart';
import 'package:okulum_app/app/models/auth_models/response_models/phone_login_response_model.dart';
import 'package:okulum_app/app/models/auth_models/response_models/student_login_response.dart';
import '../../core/services/network/base_network_service.dart';
import '../../core/constants/endpoints.dart';

class AuthRepository extends GetxService {
  final _baseNetworkService = Get.find<BaseNetworkService>();

  /// Phone login - İlk adım: telefon numarası ile giriş kontrolü
  Future<PhoneLoginResponse?> phoneLogin({required PhoneLoginRequest request}) async {
    try {
      final response = await _baseNetworkService.networkManager.post(Endpoints.phoneLogin.path, data: request.toJson());

      if (response.statusCode == 200) {
        return PhoneLoginResponse.fromJson(response.data, (json) => PhoneLoginData.fromJson(json));
      }
      return null;
    } catch (e) {
      print('Phone login error: $e');
      return null;
    }
  }

  /// Password login - İkinci adım: şifre ile giriş
  Future<PasswordLoginResponse?> passwordLogin({required PasswordLoginRequest request}) async {
    try {
      final response = await _baseNetworkService.networkManager.post(Endpoints.passwordLogin.path, data: request.toJson());

      if (response.statusCode == 200) {
        return PasswordLoginResponse.fromJson(response.data, (json) => PasswordLoginData.fromJson(json));
      }
      return null;
    } catch (e) {
      print('Password login error: $e');
      return null;
    }
  }

  /// Student login - Üçüncü adım: öğrenci seçimi ile final giriş
  Future<StudentLoginResponse?> studentLogin({required StudentLoginRequest request}) async {
    try {
      final response = await _baseNetworkService.networkManager.post(Endpoints.studentLogin.path, data: request.toJson());

      if (response.statusCode == 200) {
        return StudentLoginResponse.fromJson(response.data, (json) => StudentLoginData.fromJson(json));
      }
      return null;
    } catch (e) {
      print('Student login error: $e');
      return null;
    }
  }

  /// Logout
  Future<bool> logout() async {
    try {
      // Token'ı temizle
      _baseNetworkService.clearToken();
      return true;
    } catch (e) {
      print('Logout error: $e');
      return false;
    }
  }

  /// Set auth token
  void setAuthToken(String token) {
    _baseNetworkService.setToken('Bearer $token');
  }
}
