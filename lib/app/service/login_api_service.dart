import 'dart:convert';
import 'dart:developer';
import 'package:hiring_task/app/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginApiService {
  static final String baseUrl =
      "https://my-json-server.typicode.com/hameezk/HiringTask";

  static Future<LoginApiModel?> fetchLoginData() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/login"));

      // Check HTTP status code
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        return LoginApiModel.fromJson(jsonBody);
      } else {
        // Handle non-200 status codes
        throw Exception(
            'Failed to load data, Status Code: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // Handle client exceptions like connection issues
      log("ClientException: ${e.message}");
      return null;
    } on FormatException catch (e) {
      // Handle JSON decoding errors
      log("FormatException: ${e.message}");
      return null;
    } catch (e) {
      // Handle other exceptions
      log("Exception: $e");
      return null;
    }
  }
}
