  //CONTROLLER FILE
import 'package:get/get.dart';

class ScreenController extends GetxController {
  var counter = 0.obs; // Observable variable

  void increment() {
    counter++;
  }
}