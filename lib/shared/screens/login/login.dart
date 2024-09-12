import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import 'widgets/login_container.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 12, 57, 116),
                    Color.fromARGB(255, 12, 145, 193),
                  ],
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      /* child: Image.asset(
                        'assets/images/tcms.png',
                      ), */
                    ),
                  ]),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.6,
              color: Colors.white,
            ),
          ],
        ),
        const Center(child: LoginContainer())
      ],
    ));
  }
}
