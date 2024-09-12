import 'dart:convert';

List<ExampleModel> exampleModelListFromJson(String str) =>
    List<ExampleModel>.from(
        json.decode(str).map((x) => ExampleModel.fromJson(x)));

ExampleModel exampleModelFromJson(String str) =>
    ExampleModel.fromJson(json.decode(str));

String exampleModelToJson(ExampleModel data) => json.encode(data.toJson());

class ExampleModel {
  int id;
  String atribute;

  ExampleModel({
    required this.id,
    required this.atribute,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        id: json["id"],
        atribute: json["atribute"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "atribute": atribute,
      };

  Map<String, dynamic> toPatch() => {
        "atribute": atribute,
      };
}

List<Plant> plantFromJson(String str) =>
    List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

class Plant {
  int id;
  String code;
  String name;
  String category;
  String description;
  List<Section> sections;

  Plant({
    required this.id,
    required this.code,
    required this.name,
    required this.category,
    required this.description,
    required this.sections,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    var sectionList = json['sections'] as List;
    List<Section> sectionItems =
        sectionList.map((s) => Section.fromJson(s)).toList();

    return Plant(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      sections: sectionItems,
    );
  }
}

class Section {
  int id;
  String code;
  String name;
  String description;
  int plant;
  List<Equipment> equipments;

  Section({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.plant,
    required this.equipments,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    var equipmentList = [];
    List<Equipment> equipmentItems = [];
    if (json['equipments'] != null) {
      equipmentList = json['equipments'];
    }

    if (equipmentList.isNotEmpty) {
      equipmentItems = equipmentList.map((e) => Equipment.fromJson(e)).toList();
    }

    return Section(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
      plant: json['plant'],
      equipments: equipmentItems,
    );
  }
}

class Equipment {
  int id;
  String code;
  String name;
  String description;
  String equipmentClass;
  String type;
  String manufacturer;
  String model;
  int surveillanceTime;
  int operationalTime;
  int testDemandsPerPeriod;
  int operationalDemandsPerPeriod;
  String currentStatus;
  String currentCondition;
  String installationDate;
  int section;

  Equipment({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.equipmentClass,
    required this.type,
    required this.manufacturer,
    required this.model,
    required this.surveillanceTime,
    required this.operationalTime,
    required this.testDemandsPerPeriod,
    required this.operationalDemandsPerPeriod,
    required this.currentStatus,
    required this.currentCondition,
    required this.installationDate,
    required this.section,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
      equipmentClass: json['equipment_class'],
      type: json['type'],
      manufacturer: json['manufacturer'],
      model: json['model'],
      surveillanceTime: json['surveillance_time'],
      operationalTime: json['operational_time'],
      testDemandsPerPeriod: json['test_demands_per_period'],
      operationalDemandsPerPeriod: json['operational_demands_per_period'],
      currentStatus: json['current_status'],
      currentCondition: json['current_condition'],
      installationDate: json['installation_date'],
      section: json['section'],
    );
  }
}
