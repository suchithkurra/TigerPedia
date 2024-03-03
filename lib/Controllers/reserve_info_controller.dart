

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tigerapp/Utils/urls.dart';

import '../models/reserve_data.dart'; // Assuming the modal class file is in a models folder

class TigerController {
  Future<List<TigerReserve>> fetchTigersFromAPI() async {
    final response = await http.get(Uri.parse(URLs.tigerDataAPI));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => TigerReserve.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tigers');
    }
  }
}
