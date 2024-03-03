// search_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tigerapp/Models/tiger_info.dart';


import 'package:tigerapp/Utils/urls.dart';

class profilepage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<profilepage> {
  late Future<List<Tiger_info>> _tigersFuture;

  @override
  void initState() {
    super.initState();
    _tigersFuture = fetchTigersFromAPI();
  }

  Future<List<Tiger_info>> fetchTigersFromAPI() async {
    final response = await http.get(Uri.parse(URLs.tigerDataAPI));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Tiger_info.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tigers: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiger List'),
      ),
      body: FutureBuilder<List<Tiger_info>>(
        future: _tigersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Tiger_info> tigers = snapshot.data ?? [];
            return ListView.builder(
              itemCount: tigers.length,
              itemBuilder: (context, index) {
                final Tiger_info tiger = tigers[index];
                return ListTile(
                  title: Text(tiger.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Born: ${tiger.born}"),
                      Text("Father: ${tiger.born}"),
                      Text("Father: ${tiger.born}"),
                      Text("Mother ${tiger.mother}"),
                      Text("Siblings: ${tiger.siblings}"),
                      Text("Details: ${tiger.details}"),
                    ],
                  ),
                  onTap: () {
                    // Handle tap on the list item
                  },
                );
              },
            );
          }
        },
      ),

    );
  }
}
