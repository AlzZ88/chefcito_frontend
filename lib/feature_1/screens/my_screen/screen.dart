//SCREEN FILE
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you are using GetX for state management
import 'screen_controller.dart'; // Import the controller

class Screen extends StatelessWidget {
  Screen({super.key, required this.id});
  final String id;
  final ScreenController controller = Get.put(ScreenController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
