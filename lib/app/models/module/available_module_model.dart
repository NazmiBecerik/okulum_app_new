// lib/app/models/module/available_module_model.dart

class AvailableModule {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String name;
  String slug;

  AvailableModule({required this.id, required this.createdAt, required this.updatedAt, this.deletedAt, required this.name, required this.slug});

  factory AvailableModule.fromJson(Map<String, dynamic> json) {
    return AvailableModule(
      id: json["ID"] ?? 0,
      createdAt: json["CreatedAt"] ?? "",
      updatedAt: json["UpdatedAt"] ?? "",
      deletedAt: json["DeletedAt"],
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"ID": id, "CreatedAt": createdAt, "UpdatedAt": updatedAt, "DeletedAt": deletedAt, "name": name, "slug": slug};
  }
}
