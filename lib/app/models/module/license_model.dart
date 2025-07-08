// lib/app/models/module/license_model.dart

import '../user/user_model.dart';
import 'module_model.dart';

class License {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int moduleId;
  Module module;
  int userId;
  User user;
  int status;
  String plan;
  String expiredAt;

  License({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.moduleId,
    required this.module,
    required this.userId,
    required this.user,
    required this.status,
    required this.plan,
    required this.expiredAt,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      moduleId: json["module_id"] ?? 0,
      module: Module.fromJson(json["module"] ?? {}),
      userId: json["user_id"] ?? 0,
      user: User.fromJson(json["user"] ?? {}),
      status: json["status"] ?? 0,
      plan: json["plan"] ?? "",
      expiredAt: json["expired_at"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
      "module_id": moduleId,
      "module": module.toJson(),
      "user_id": userId,
      "user": user.toJson(),
      "status": status,
      "plan": plan,
      "expired_at": expiredAt,
    };
  }
}
