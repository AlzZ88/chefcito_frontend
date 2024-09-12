import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../dashboard_visualizer/dashboard_visualizer.dart';

class DashboardVisualizerAuto extends StatefulWidget {
  const DashboardVisualizerAuto({super.key});

  @override
  State<DashboardVisualizerAuto> createState() =>
      _DashboardVisualizerAutoState();
}

class _DashboardVisualizerAutoState extends State<DashboardVisualizerAuto> {
  final List<String> dashboards = [
    "https://app.powerbi.com/view?r=eyJrIjoiZmFlNTliYTItYjAxOC00ZDA0LWI3OGMtZTk1Y2FhMGY4ZGIxIiwidCI6ImE5OGJlZTZjLTVmZWQtNGU3NS04MDkxLWEyZmU5ZGZmNzQ4ZSJ9",
    "https://app.powerbi.com/view?r=eyJrIjoiZmFlNTliYTItYjAxOC00ZDA0LWI3OGMtZTk1Y2FhMGY4ZGIxIiwidCI6ImE5OGJlZTZjLTVmZWQtNGU3NS04MDkxLWEyZmU5ZGZmNzQ4ZSJ9&pageName=ReportSection91764ee3d53a6e744d1d",
    "https://app.powerbi.com/view?r=eyJrIjoiZmFlNTliYTItYjAxOC00ZDA0LWI3OGMtZTk1Y2FhMGY4ZGIxIiwidCI6ImE5OGJlZTZjLTVmZWQtNGU3NS04MDkxLWEyZmU5ZGZmNzQ4ZSJ9&pageName=ReportSection91764ee3d53a6e744d1d&pageName=55b6f9cc6ad8683309db",
    "https://app.powerbi.com/view?r=eyJrIjoiZmFlNTliYTItYjAxOC00ZDA0LWI3OGMtZTk1Y2FhMGY4ZGIxIiwidCI6ImE5OGJlZTZjLTVmZWQtNGU3NS04MDkxLWEyZmU5ZGZmNzQ4ZSJ9&pageName=ReportSection91764ee3d53a6e744d1d&pageName=ReportSection4cb697e6475da80c3cd8"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height - 60,
        width: MediaQuery.sizeOf(context).width,
        child: CarouselSlider(
          options: CarouselOptions(
              autoPlay: true, autoPlayInterval: const Duration(seconds: 60)),
          items: dashboards
              .map((item) => DashboardVisualizer(
                    url: item.toString(),
                  ))
              .toList(),
        ));
  }
}
