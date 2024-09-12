
import 'package:frontend_template/shared/widgets/nav_bar/widgets/tcms_button/tcms_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCMSButton extends StatelessWidget {
  TCMSButton({super.key});
  final TCMSButtonController controller = Get.put(TCMSButtonController()); // Initialize the controller
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.open_drawer(context);
      },
      child: SizedBox(
        height: 80,
        width: MediaQuery.sizeOf(context).width * 0.12,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/images/tcms.png',
          ),
        ),
      ),
    );
  }
}