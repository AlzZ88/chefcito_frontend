import 'package:frontend_template/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../feature_1/domain/models/model.dart';
import '../../repositories/logbook_repository.dart';

class HierarchyBarController extends GetxController {
  List<dynamic> plants = [];
  List<dynamic> plantSections = [];
  List<dynamic> sectionEquipments = [];
  List<dynamic> sections = [];
  List<dynamic> equipments = [];
  String? plant;
  String? section;
  String? equipment;
  final RxBool _isLoading = true.obs;

  RxBool get isLoading => _isLoading;

  Future<void> data_packaging(Plant plant) async {
    plants = [];
    plantSections = [];
    sectionEquipments = [];
    plants.add({"id": plant.id, "name": plant.name});
    for (var section in plant.sections) {
      plantSections.add(
          {"id": section.id, "name": section.name, "parentID": section.plant});
      for (var equipment in section.equipments) {
        sectionEquipments.add({
          "id": equipment.id,
          "name": equipment.name,
          "parentID": equipment.section
        });
      }
    }
  }

  Future<void> get_hierarchy() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isLoading.value = true;
    });
    final response =
        await LogBookAPI().get_query(LOGBOOK_HOST, "hierarchy/plant/");
    List<Plant> processedResponse = plantFromJson(response);
    await data_packaging(processedResponse[0]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isLoading.value = false;
    });
  }
}
