import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeButtonController extends GetxController {
  void goto_home(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
