// lib/app/models/group/group_type_model.dart

import '../user/user_model.dart';

class GroupType {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  dynamic name;
  dynamic userId;
  DetailedUser user;
  bool status;

  GroupType({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.name,
    this.userId,
    required this.user,
    required this.status,
  });

  factory GroupType.fromJson(Map<String, dynamic> json) {
    return GroupType(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      name: json["Name"],
      userId: json["UserID"],
      user: DetailedUser.fromJson(json["User"] ?? {}),
      status: json["Status"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
      "Name": name,
      "UserID": userId,
      "User": user.toJson(),
      "Status": status,
    };
  }
}
