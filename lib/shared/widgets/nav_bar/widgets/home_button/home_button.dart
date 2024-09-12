import 'package:frontend_template/shared/widgets/nav_bar/widgets/home_button/home_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

class HomeButton extends StatelessWidget {
  HomeButton({super.key});
  final HomeButtonController controller = Get.put(HomeButtonController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.go('/');
      },
      child: SizedBox(
        height: 80,
        width: MediaQuery.sizeOf(context).width * 0.12,
        child: Image.asset(
          'assets/images/header_orbitas_fondo.png',
        ),
      ),
    );
  }
}
