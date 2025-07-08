// lib/app/models/student/student_model.dart

import '../user/user_model.dart';
import '../group/group_model.dart';

class Student {
  int id;
  int userId;
  DetailedUser user;
  String avatar;
  String name;
  dynamic studentPhone;
  bool status;
  int schoolNumber;
  dynamic idNumber;
  dynamic groupId;
  Group group;
  dynamic birthdate;
  dynamic year;
  dynamic parentName;
  dynamic parentPhone;
  String parentType;
  dynamic secondParentName;
  dynamic secondParentPhone;
  String secondParentType;
  dynamic birthdateSentYear;
  dynamic classOne;
  dynamic classTwo;
  String gender;
  String recordType;
  String forceParent;
  String fatherAlive;
  String motherAlive;
  String isEntegration;
  String fatherIsSeperated;
  String motherIsSeperated;
  dynamic note;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  Student({
    required this.id,
    required this.userId,
    required this.user,
    required this.avatar,
    required this.name,
    this.studentPhone,
    required this.status,
    required this.schoolNumber,
    this.idNumber,
    this.groupId,
    required this.group,
    this.birthdate,
    this.year,
    this.parentName,
    this.parentPhone,
    required this.parentType,
    this.secondParentName,
    this.secondParentPhone,
    required this.secondParentType,
    this.birthdateSentYear,
    this.classOne,
    this.classTwo,
    required this.gender,
    required this.recordType,
    required this.forceParent,
    required this.fatherAlive,
    required this.motherAlive,
    required this.isEntegration,
    required this.fatherIsSeperated,
    required this.motherIsSeperated,
    this.note,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json["ID"] ?? 0,
      userId: json["UserID"] ?? 0,
      user: DetailedUser.fromJson(json["User"] ?? {}),
      avatar: json["Avatar"] ?? "",
      name: json["Name"] ?? "",
      studentPhone: json["StudentPhone"],
      status: json["Status"] ?? false,
      schoolNumber: json["SchoolNumber"] ?? 0,
      idNumber: json["IdNumber"],
      groupId: json["GroupID"],
      group: Group.fromJson(json["Group"] ?? {}),
      birthdate: json["Birthdate"],
      year: json["Year"],
      parentName: json["ParentName"],
      parentPhone: json["ParentPhone"],
      parentType: json["ParentType"] ?? "",
      secondParentName: json["SecondParentName"],
      secondParentPhone: json["SecondParentPhone"],
      secondParentType: json["SecondParentType"] ?? "",
      birthdateSentYear: json["BirthdateSentYear"],
      classOne: json["ClassOne"],
      classTwo: json["ClassTwo"],
      gender: json["Gender"] ?? "",
      recordType: json["RecordType"] ?? "",
      forceParent: json["ForceParent"] ?? "",
      fatherAlive: json["FatherAlive"] ?? "",
      motherAlive: json["MotherAlive"] ?? "",
      isEntegration: json["IsEntegration"] ?? "",
      fatherIsSeperated: json["FatherIsSeperated"] ?? "",
      motherIsSeperated: json["MotherIsSeperated"] ?? "",
      note: json["Note"],
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "UserID": userId,
      "User": user.toJson(),
      "Avatar": avatar,
      "Name": name,
      "StudentPhone": studentPhone,
      "Status": status,
      "SchoolNumber": schoolNumber,
      "IdNumber": idNumber,
      "GroupID": groupId,
      "Group": group.toJson(),
      "Birthdate": birthdate,
      "Year": year,
      "ParentName": parentName,
      "ParentPhone": parentPhone,
      "ParentType": parentType,
      "SecondParentName": secondParentName,
      "SecondParentPhone": secondParentPhone,
      "SecondParentType": secondParentType,
      "BirthdateSentYear": birthdateSentYear,
      "ClassOne": classOne,
      "ClassTwo": classTwo,
      "Gender": gender,
      "RecordType": recordType,
      "ForceParent": forceParent,
      "FatherAlive": fatherAlive,
      "MotherAlive": motherAlive,
      "IsEntegration": isEntegration,
      "FatherIsSeperated": fatherIsSeperated,
      "MotherIsSeperated": motherIsSeperated,
      "Note": note,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
    };
  }
}
