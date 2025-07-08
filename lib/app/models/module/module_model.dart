// lib/app/models/module/module_model.dart

import '../user/user_model.dart';
import 'license_model.dart';
import 'available_module_model.dart';

class Module {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String name;
  String description;
  int amount;
  int status;
  String type;
  List<License> licenses;
  AvailableModule availableModule;
  int availableModuleId;

  Module({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.description,
    required this.amount,
    required this.status,
    required this.type,
    required this.licenses,
    required this.availableModule,
    required this.availableModuleId,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      amount: json["amount"] ?? 0,
      status: json["status"] ?? 0,
      type: json["type"] ?? "",
      licenses: (json["licenses"] as List?)?.map((e) => License.fromJson(e)).toList() ?? [],
      availableModule: AvailableModule.fromJson(json["available_module"] ?? {}),
      availableModuleId: json["available_module_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "DeletedAt": deletedAt,
      "name": name,
      "description": description,
      "amount": amount,
      "status": status,
      "type": type,
      "licenses": licenses.map((e) => e.toJson()).toList(),
      "available_module": availableModule.toJson(),
      "available_module_id": availableModuleId,
    };
  }
}
