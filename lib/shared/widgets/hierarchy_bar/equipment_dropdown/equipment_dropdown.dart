import 'package:frontend_template/shared/widgets/hierarchy_bar/hierarchy_bar_controller.dart';
import 'package:flutter/material.dart';

class EquipmentDropdown extends StatefulWidget {
  const EquipmentDropdown(
      {super.key, this.onChanged, required this.controller});

  final HierarchyBarController controller;
  final Function(String?)? onChanged;
  @override
  State<EquipmentDropdown> createState() => _EquipmentDropdownState();
}

class _EquipmentDropdownState extends State<EquipmentDropdown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 200,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 102, 163, 213),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButtonFormField(
            isExpanded: true,
            dropdownColor: const Color.fromARGB(255, 102, 163, 213),
            decoration: InputDecoration(
              isDense: true,
              constraints: BoxConstraints.tight(const Size.fromHeight(25)),
            ),
            hint: const Text("Equipo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.bold,
                )),
            value: widget.controller.equipment,
            items: widget.controller.sectionEquipments
                .where((item) =>
                    item['parentID'].toString() ==
                    widget.controller.section.toString())
                .map((item) {
              return DropdownMenuItem(
                value: item['id'].toString(),
                child: Text(
                  item['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
            onChanged: widget.onChanged),
      ),
    );
  }
}
