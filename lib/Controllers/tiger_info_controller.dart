import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/tiger_info.dart';
import 'package:tigerapp/Utils/urls.dart';

class TigerInfoController {
  final String baseUrl = URLs.tigerDataAPI;

  Future<List<tiger_information>> fetchTigers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_all_tigers_mysql/'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return (jsonData as List).map((json) => tiger_information.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch tigers: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch tigers: $e');
    }
  }
}
