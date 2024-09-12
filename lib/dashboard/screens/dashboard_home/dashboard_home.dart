import 'package:frontend_template/shared/screens/home/widgets/home_grid_button/home_grid_button.dart';
import 'package:frontend_template/shared/widgets/hierarchy_drawer/hierarchy_drawer.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/nav_bar/nav_bar.dart';
import '../../../shared/widgets/tcms_drawer/tcms_drawer.dart';
import 'package:go_router/go_router.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridButton(
                        name: "Volver",
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
                        name: "Analisis",
                        onTap: () {
                          context.go('/dashboard/analysis');
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
