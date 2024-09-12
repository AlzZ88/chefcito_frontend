import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  double get duration => _duration;
  double _duration = 60;
  ///
  /// update duration.
  ///
  void update(double new_duration) async {
    _duration = new_duration;
  }
}