class PhoneLoginRequest {
  String? phone;

  PhoneLoginRequest({this.phone});

  Map<String, dynamic> toJson() => {"phone": phone};

  factory PhoneLoginRequest.fromJson(Map<String, dynamic> json) {
    return PhoneLoginRequest(phone: json["phone"] ?? "");
  }
}
