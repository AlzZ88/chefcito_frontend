import 'package:frontend_template/dashboard/widgets/dashboard_visualizer_auto/dashboard_visualizer_auto.dart';
import 'package:frontend_template/shared/widgets/hierarchy_drawer/hierarchy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../shared/widgets/tcms_drawer/tcms_drawer.dart';
import '../../../shared/screens/home/widgets/home_grid_button/mini_button.dart';

class DashboardDisplay extends StatefulWidget {
  const DashboardDisplay({super.key});

  @override
  State<DashboardDisplay> createState() => _DashboardDisplayState();
}

class _DashboardDisplayState extends State<DashboardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                  ],
                ),
                const DashboardVisualizerAuto(),
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
