import 'package:frontend_template/shared/widgets/nav_bar/widgets/account_nav/account_nav.dart';
import 'package:frontend_template/shared/widgets/nav_bar/widgets/home_button/home_button.dart';
import 'package:frontend_template/shared/widgets/nav_bar/widgets/tcms_button/tcms_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nav_bar_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final NavBarController controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 12, 12, 12),
            Color.fromARGB(255, 25, 25, 25),
          ],
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeButton(),
          Row(
            children: [
              AccountNav(),
              TCMSButton(),
            ],
          )
        ],
      ),
    );
  }
}
