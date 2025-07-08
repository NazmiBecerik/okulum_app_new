// lib/app/models/group/group_model.dart

import '../user/user_model.dart';
import 'group_type_model.dart';

class Group {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  dynamic userId;
  DetailedUser user;
  dynamic name;
  dynamic description;
  String recordType;
  bool status;
  dynamic groupTypeId;
  GroupType groupType;
  dynamic contacts;

  Group({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.userId,
    required this.user,
    this.name,
    this.description,
    required this.recordType,
    required this.status,
    this.groupTypeId,
    required this.groupType,
    this.contacts,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      userId: json["UserID"],
      user: DetailedUser.fromJson(json["User"] ?? {}),
      name: json["Name"],
      description: json["Description"],
      recordType: json["RecordType"] ?? "",
      status: json["Status"] ?? false,
      groupTypeId: json["GroupTypeID"],
      groupType: GroupType.fromJson(json["GroupType"] ?? {}),
      contacts: json["Contacts"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
      "UserID": userId,
      "User": user.toJson(),
      "Name": name,
      "Description": description,
      "RecordType": recordType,
      "Status": status,
      "GroupTypeID": groupTypeId,
      "GroupType": groupType.toJson(),
      "Contacts": contacts,
    };
  }
}
