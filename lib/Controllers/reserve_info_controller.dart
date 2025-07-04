import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/reserve_data.dart';
import '../Models/tiger_info.dart';
import 'package:tigerapp/Utils/urls.dart';

class TigerReserveController {
  final String baseUrl = URLs.tigerDataAPI;

  Future<List<TigerReserve>> fetchReserves() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_all_tiger_reserves_mysql/'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return (jsonData as List).map((json) => TigerReserve.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch tigers: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch tigers: $e');
    }
  }
}
