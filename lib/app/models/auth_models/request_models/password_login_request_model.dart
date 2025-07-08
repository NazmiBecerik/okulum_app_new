class PasswordLoginRequest {
  String? password;
  String? phone;

  PasswordLoginRequest({this.password, this.phone});

  Map<String, dynamic> toJson() => {"password": password, "phone": phone};

  factory PasswordLoginRequest.fromJson(Map<String, dynamic> json) {
    return PasswordLoginRequest(password: json["password"] ?? "", phone: json["phone"] ?? "");
  }
}
