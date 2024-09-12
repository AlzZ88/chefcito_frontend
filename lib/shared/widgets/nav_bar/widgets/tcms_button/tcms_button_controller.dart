import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCMSButtonController extends GetxController {
  void open_drawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }
}
