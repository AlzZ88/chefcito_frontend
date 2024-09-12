import 'package:frontend_template/shared/widgets/hierarchy_bar/equipment_dropdown/equipment_dropdown.dart';
import 'package:frontend_template/shared/widgets/hierarchy_bar/hierarchy_controls/hierarchy_controls.dart';
import 'package:frontend_template/shared/widgets/hierarchy_bar/plant_dropdown/plant_dropdown.dart';
import 'package:frontend_template/shared/widgets/hierarchy_bar/section_dropdown/section_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'hierarchy_bar_controller.dart';

class HierarchyBar extends StatefulWidget {
  const HierarchyBar({super.key});

  @override
  State<HierarchyBar> createState() => _HierarchyBarState();
}

class _HierarchyBarState extends State<HierarchyBar> {
  final HierarchyBarController controller = Get.put(HierarchyBarController());
  @override
  void initState() {
    controller.get_hierarchy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 12, 57, 116),
            Color.fromARGB(255, 12, 145, 193),
          ],
        ),
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HierarchyButton(),
          Obx(
            () => controller.isLoading.value
                ? Container(
                    width: 200,
                    height: 25,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 102, 163, 213),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                  )
                : PlantDropdown(
                    controller: controller,
                    onChanged: (value) {
                      setState(
                        () {
                          controller.plant = value;
                          controller.section = null;
                          controller.equipment = null;
                        },
                      );
                    },
                  ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
          Obx(
            () => controller.isLoading.value
                ? Container(
                    width: 200,
                    height: 25,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 102, 163, 213),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                color: Colors.white))),
                  )
                : SectionDropdown(
                    controller: controller,
                    onChanged: (value) {
                      setState(
                        () {
                          controller.section = value;
                          controller.equipment = null;
                        },
                      );
                    },
                  ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
          Obx(
            () => controller.isLoading.value
                ? Container(
                    width: 200,
                    height: 25,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 102, 163, 213),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                color: Colors.white))),
                  )
                : EquipmentDropdown(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        controller.equipment = value;
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
