import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String apiUrl = 'http://127.0.0.1:8000/api/departure-port';

  Future<List<String>> getDropdownOptions() async {
    final response = await http.get(Uri.parse('$apiUrl/dropdown-options'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Assuming the API returns a list of strings for dropdown options
      return List<String>.from(data);
    } else {
      throw Exception('Failed to load dropdown options');
    }
  }
}
