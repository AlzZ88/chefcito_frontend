import 'package:flutter/material.dart';
import 'login_widget/login_widget.dart';
import 'signin_widget/signup_widget.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});
  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: "Iniciar sesión",
                    ),
                    Tab(
                      text: "Crear Cuenta",
                    ),
                  ],
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    LoginWidget(
                      width: (MediaQuery.sizeOf(context).width * 0.4) * 0.5,
                    ),
                    SignupWidget(
                      width: (MediaQuery.sizeOf(context).width * 0.4) * 0.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
