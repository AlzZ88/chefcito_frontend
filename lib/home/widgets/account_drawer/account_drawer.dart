import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account/account.dart';
import 'account_drawer_controller.dart';

class AccountDrawer extends StatelessWidget {
  AccountDrawer({super.key});
  final AccountDrawerController controller = Get.put(AccountDrawerController());
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
            child: Container()/* Image.asset('assets/images/tcms.png') */,
          ),
          /* const CurrentAppBanner(), */
          /* const AppGrid(), */
          Account(),
        ],
      ),
    );
  }
}
