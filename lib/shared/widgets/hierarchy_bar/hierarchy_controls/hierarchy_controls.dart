import 'package:frontend_template/shared/widgets/nav_bar/widgets/home_button/home_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HierarchyButton extends StatelessWidget {
  HierarchyButton({super.key});
  final HomeButtonController controller = Get.put(HomeButtonController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            controller.goto_home(context);
          },
          icon: const Icon(
            Icons.account_tree_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
