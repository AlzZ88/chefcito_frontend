import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account/account.dart';
import 'app_grid/app_grid.dart';
import 'current_app_banner/current_app_banner.dart';
import 'tcms_drawer_controller.dart';

class TCMSDrawer extends StatelessWidget {
  TCMSDrawer({super.key});
  final TCMSDrawerController controller = Get.put(TCMSDrawerController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //
      //
      //
      child: Column(
        //
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            //
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 12, 147, 195),
            ),
            child: Image.asset('assets/images/tcms.png'),
          ),
          const CurrentAppBanner(),
          const AppGrid(),
          Account(),
        ],
      ),
    );
  }
}
