import 'package:flutter/material.dart';
import '../../shared/constants.dart';
import '../domain/models/model.dart';
import '../domain/repositories/feature_repository.dart';

class MyProvider extends ChangeNotifier {
  List<ExampleModel> _data = [];
  List<ExampleModel> get data => _data;

  ///
  /// Fetch data from repository.
  ///
  void myMethod(String equipment) async {
    try {
      final response =
          await APIRepository().get_query(API_HOST, "endpoint"); //without "/"
      if (response != "") {
        _data = exampleModelListFromJson(response);
      }
    } catch (e) {
      // Handle error, e.g., log it or show a message
      print("Error fetching example model: $e");
    }
  }
}
