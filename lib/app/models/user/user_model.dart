// lib/app/models/user/user_model.dart

class User {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int userId;
  String phone;
  String password;
  String deviceId;
  String deviceName;
  String userType;

  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.phone,
    required this.password,
    required this.deviceId,
    required this.deviceName,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      userId: json["UserID"] ?? 0,
      phone: json["Phone"] ?? "",
      password: json["Password"] ?? "",
      deviceId: json["DeviceID"] ?? "",
      deviceName: json["DeviceName"] ?? "",
      userType: json["UserType"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
      "UserID": userId,
      "Phone": phone,
      "Password": password,
      "DeviceID": deviceId,
      "DeviceName": deviceName,
      "UserType": userType,
    };
  }
}

class DetailedUser {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String shortName;
  String longName;
  String name;
  String surname;
  String avatar;
  String phone;
  String email;
  String username;
  bool isPassive;
  bool status;
  bool isRandevuActive;
  bool isLcvActive;
  bool accountStatus;
  bool isVerified;
  String testTime;
  int credit;
  int debt;
  String lastProcess;
  String landlinePhone;
  dynamic settings;
  dynamic representativeSettings;
  dynamic balance;
  String deviceId;
  String pushSubscriptionId;
  dynamic loginVerificationPhones;

  DetailedUser({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.shortName,
    required this.longName,
    required this.name,
    required this.surname,
    required this.avatar,
    required this.phone,
    required this.email,
    required this.username,
    required this.isPassive,
    required this.status,
    required this.isRandevuActive,
    required this.isLcvActive,
    required this.accountStatus,
    required this.isVerified,
    required this.testTime,
    required this.credit,
    required this.debt,
    required this.lastProcess,
    required this.landlinePhone,
    this.settings,
    this.representativeSettings,
    this.balance,
    required this.deviceId,
    required this.pushSubscriptionId,
    this.loginVerificationPhones,
  });

  factory DetailedUser.fromJson(Map<String, dynamic> json) {
    return DetailedUser(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      shortName: json["ShortName"] ?? "",
      longName: json["LongName"] ?? "",
      name: json["Name"] ?? "",
      surname: json["Surname"] ?? "",
      avatar: json["Avatar"] ?? "",
      phone: json["Phone"] ?? "",
      email: json["Email"] ?? "",
      username: json["Username"] ?? "",
      isPassive: json["IsPassive"] ?? false,
      status: json["Status"] ?? false,
      isRandevuActive: json["IsRandevuActive"] ?? false,
      isLcvActive: json["IsLCVActive"] ?? false,
      accountStatus: json["AccountStatus"] ?? false,
      isVerified: json["IsVerified"] ?? false,
      testTime: json["TestTime"] ?? "",
      credit: json["Credit"] ?? 0,
      debt: json["Debt"] ?? 0,
      lastProcess: json["LastProcess"] ?? "",
      landlinePhone: json["LandlinePhone"] ?? "",
      settings: json["Settings"],
      representativeSettings: json["RepresentativeSettings"],
      balance: json["Balance"],
      deviceId: json["DeviceID"] ?? "",
      pushSubscriptionId: json["PushSubscriptionID"] ?? "",
      loginVerificationPhones: json["LoginVerificationPhones"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
      "ShortName": shortName,
      "LongName": longName,
      "Name": name,
      "Surname": surname,
      "Avatar": avatar,
      "Phone": phone,
      "Email": email,
      "Username": username,
      "IsPassive": isPassive,
      "Status": status,
      "IsRandevuActive": isRandevuActive,
      "IsLCVActive": isLcvActive,
      "AccountStatus": accountStatus,
      "IsVerified": isVerified,
      "TestTime": testTime,
      "Credit": credit,
      "Debt": debt,
      "LastProcess": lastProcess,
      "LandlinePhone": landlinePhone,
      "Settings": settings,
      "RepresentativeSettings": representativeSettings,
      "Balance": balance,
      "DeviceID": deviceId,
      "PushSubscriptionID": pushSubscriptionId,
      "LoginVerificationPhones": loginVerificationPhones,
    };
  }
}
