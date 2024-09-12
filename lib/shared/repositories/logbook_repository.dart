import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LogBookAPI {
  Future<String> get_query(String host, String endpoint) async {
    Response response;

    try {
      response = await http.get(Uri.parse("$host/$endpoint"));

      if (response.statusCode == 200 || response.statusCode == 404) {
        return response.body;
      } else {
        if (response.statusCode == 500) {
          throw Exception('Error en el servidor');
        }

        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Error: $e');
    } finally {}
  }

  Future<void> post_query(String host, String endpoint, Object? body) async {
    final Response response;

    try {
      response = await http.post(Uri.parse("$host/$endpoint"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 404) {
      } else {
        if (response.statusCode == 500) {
          throw Exception('Error en el servidor');
        }

        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
