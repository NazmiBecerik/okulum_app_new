import '../../common/base_response.dart';
import '../../user/user_model.dart';
import '../../student/student_model.dart';

class PasswordLoginData {
  String token;
  User user;
  List<Student> students;
  dynamic module;
  String secret;

  PasswordLoginData({required this.token, required this.user, required this.students, this.module, required this.secret});

  factory PasswordLoginData.fromJson(Map<String, dynamic> json) {
    return PasswordLoginData(
      token: json["token"] ?? "",
      user: User.fromJson(json["user"] ?? {}),
      students: (json["students"] as List?)?.map((e) => Student.fromJson(e)).toList() ?? [],
      module: json["module"],
      secret: json["secret"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
    "students": students.map((e) => e.toJson()).toList(),
    "module": module,
    "secret": secret,
  };
}

typedef PasswordLoginResponse = ApiResponse<PasswordLoginData>;
