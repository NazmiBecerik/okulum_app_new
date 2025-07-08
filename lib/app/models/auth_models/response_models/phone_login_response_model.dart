import 'package:okulum_app/app/models/common/base_response.dart';

class PhoneLoginData {
  bool isFirstLogin;
  String message;

  PhoneLoginData({required this.isFirstLogin, required this.message});

  factory PhoneLoginData.fromJson(Map<String, dynamic> json) {
    return PhoneLoginData(isFirstLogin: json["is_first_login"] ?? false, message: json["message"] ?? "");
  }

  Map<String, dynamic> toJson() => {"is_first_login": isFirstLogin, "message": message};
}

typedef PhoneLoginResponse = ApiResponse<PhoneLoginData>;
