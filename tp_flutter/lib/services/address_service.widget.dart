import 'dart:convert';
import 'package:http/http.dart' as http;

class AddrService {
  static const String baseUrl = "https://api-adresse.data.gouv.fr";

  static Future<Map<String, dynamic>> searchAddress(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search/?q=$query'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load address');
    }
  }
}
