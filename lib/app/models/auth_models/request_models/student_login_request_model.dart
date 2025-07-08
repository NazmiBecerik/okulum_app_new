class StudentLoginRequest {
  String secret;
  int studentId;

  StudentLoginRequest({required this.secret, required this.studentId});

  Map<String, dynamic> toJson() {
    return {"secret": secret, "student_id": studentId};
  }

  factory StudentLoginRequest.fromJson(Map<String, dynamic> json) {
    return StudentLoginRequest(secret: json["secret"] ?? "", studentId: json["student_id"] ?? 0);
  }
}
