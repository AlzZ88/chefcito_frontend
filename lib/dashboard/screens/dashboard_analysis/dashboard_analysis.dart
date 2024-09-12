import 'package:frontend_template/dashboard/widgets/dashboard_visualizer/dashboard_visualizer.dart';
import 'package:frontend_template/shared/widgets/hierarchy_drawer/hierarchy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/nav_bar/nav_bar.dart';
import '../../../../shared/widgets/tcms_drawer/tcms_drawer.dart';
import '../../../shared/screens/home/widgets/home_grid_button/mini_button.dart';

class DashboardAnalisys extends StatefulWidget {
  const DashboardAnalisys({super.key});

  @override
  State<DashboardAnalisys> createState() => _DashboardAnalisysState();
}

class _DashboardAnalisysState extends State<DashboardAnalisys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    MiniButton(
                      name: "Volver",
                      onTap: () {
                        context.go('/');
                      },
                    ),
                    MiniButton(
                      name: "Vitrina",
                      onTap: () {
                        context.go('/dashboard/display');
                      },
                    ),
                  ],
                ),
                const DashboardVisualizer(
                  url:
                      "https://app.powerbi.com/view?r=eyJrIjoiZmFlNTliYTItYjAxOC00ZDA0LWI3OGMtZTk1Y2FhMGY4ZGIxIiwidCI6ImE5OGJlZTZjLTVmZWQtNGU3NS04MDkxLWEyZmU5ZGZmNzQ4ZSJ9",
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const HierarchyDrawer(),
      endDrawer: TCMSDrawer(),
    );
  }
}
