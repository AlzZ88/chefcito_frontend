import 'package:frontend_template/shared/widgets/hierarchy_bar/hierarchy_bar_controller.dart';
import 'package:flutter/material.dart';

class PlantDropdown extends StatefulWidget {
  const PlantDropdown(
      {super.key, required this.controller, required this.onChanged});
  final HierarchyBarController controller;
  final Function(String?) onChanged;
  @override
  State<PlantDropdown> createState() => _PlantDropdownState();
}

class _PlantDropdownState extends State<PlantDropdown> {
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonFormField(
          dropdownColor: const Color.fromARGB(255, 28, 35, 40),
          isExpanded: true,
          decoration: InputDecoration(
            isDense: true,
            constraints: BoxConstraints.tight(const Size.fromHeight(25)),
          ),
          hint: const Text(
            "Planta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Readex Pro',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: widget.controller.plant,
          items: widget.controller.plants.map(
            (item) {
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
            },
          ).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
