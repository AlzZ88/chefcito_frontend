import 'package:frontend_template/shared/screens/home/widgets/home_grid_button/home_grid_button.dart';
import 'package:frontend_template/shared/screens/home/widgets/pub/pab.dart';
import 'package:frontend_template/shared/widgets/hierarchy_bar/hierarchy_bar.dart';
import 'package:frontend_template/shared/widgets/hierarchy_drawer/hierarchy_drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/tcms_drawer/tcms_drawer.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(),
          const HierarchyBar(),
          const Pab(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 200,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridButton(
                        name: "Reportes",
                        onTap: () {
                          context.go('/');
                        },
                      ),
                      HomeGridButton(
                        name: "Conditiones",
                        onTap: () {
                          context.go('/');
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridButton(
                        name: "Avisos",
                        onTap: () {
                          context.go('/');
                        },
                      ),
                      HomeGridButton(
                        name: "Dashboard",
                        onTap: () {
                          context.go('/dashboard');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const HierarchyDrawer(),
      endDrawer: TCMSDrawer(),
    );
  }
}
