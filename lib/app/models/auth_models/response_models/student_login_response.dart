// lib/app/models/auth/responses/student_login_response.dart

import '../../common/base_response.dart';
import '../../user/user_model.dart';
import '../../student/student_model.dart';
import '../../module/module_model.dart';

class StudentLoginData {
  String token;
  Student selectedStudent;
  List<Student> students;
  User user;
  List<Module> module;

  StudentLoginData({required this.token, required this.selectedStudent, required this.students, required this.user, required this.module});

  factory StudentLoginData.fromJson(Map<String, dynamic> json) {
    return StudentLoginData(
      token: json["token"] ?? "",
      selectedStudent: Student.fromJson(json["selected_student"] ?? {}),
      students: (json["students"] as List?)?.map((e) => Student.fromJson(e)).toList() ?? [],
      user: User.fromJson(json["user"] ?? {}),
      module: (json["module"] as List?)?.map((e) => Module.fromJson(e)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "selected_student": selectedStudent.toJson(),
      "students": students.map((e) => e.toJson()).toList(),
      "user": user.toJson(),
      "module": module.map((e) => e.toJson()).toList(),
    };
  }
}

typedef StudentLoginResponse = ApiResponse<StudentLoginData>;
