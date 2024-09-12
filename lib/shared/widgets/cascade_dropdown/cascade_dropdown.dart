import 'package:frontend_template/feature_1/domain/models/model.dart';
import 'package:frontend_template/shared/constants.dart';
import 'package:frontend_template/shared/repositories/logbook_repository.dart';
import 'package:flutter/material.dart';
import 'package:frontend_template/feature_1/domain/models/model.dart' as models;

class CascadeDropdown extends StatefulWidget {
  const CascadeDropdown({super.key});

  @override
  State<CascadeDropdown> createState() => _CascadeDropdownState();
}

class _CascadeDropdownState extends State<CascadeDropdown> {
  List<dynamic> plants = [];
  List<dynamic> plantSections = [];
  List<dynamic> sectionEquipments = [];
  List<dynamic> sections = [];
  List<dynamic> equipments = [];
  String? _plant;
  String? _section;
  String? _equipment;
  bool _isLoading = true;

  void prepareData(Plant plant) {
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

  void fetchData() async {
    final response =
        await LogBookAPI().get_query(LOGBOOK_HOST, "hierarchy/plant/");
    List<Plant> processedResponse = models.plantFromJson(response);
    prepareData(processedResponse[0]);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget _button1() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonHideUnderline(
          child: Container(
            width: 250,
            height: 50,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              hint: const Text("Choose Plant"),
              value: _plant,
              items: plants.map((item) {
                return DropdownMenuItem(
                  value: item['id'].toString(),
                  child: Text(item['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _plant = value;
                  sections = plantSections
                      .where(
                        (section) =>
                            section["parentID"].toString() == value.toString(),
                      )
                      .toList();
                  _section = null;
                  _equipment = null;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _button2() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonHideUnderline(
          child: Container(
            width: 250,
            height: 50,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              hint: const Text("Choose Section"),
              value: _section,
              items: sections.map((item) {
                return DropdownMenuItem(
                  value: item['id'].toString(),
                  child: Text(item['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _section = value;
                  equipments = sectionEquipments
                      .where(
                        (equipment) =>
                            equipment["parentID"].toString() ==
                            value.toString(),
                      )
                      .toList();
                  _equipment = null;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _button3() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonHideUnderline(
          child: Container(
            width: 250,
            height: 50,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              hint: const Text("Choose Equipment"),
              value: _equipment,
              items: equipments.map((item) {
                return DropdownMenuItem(
                  value: item['id'].toString(),
                  child: Text(item['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _equipment = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Row(
            children: [
              const SizedBox(width: 30),
              _button1(),
              const SizedBox(width: 30),
              _button2(),
              const SizedBox(width: 30),
              _button3(),
              const SizedBox(width: 30),
            ],
          );
  }
}
