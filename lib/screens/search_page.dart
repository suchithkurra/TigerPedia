import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tigerapp/Utils/urls.dart';
import 'package:tigerapp/screens/tiger_info_screen.dart';
import 'package:tigerapp/Models/tiger_info.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Tiger_info> allTigers = [];
  late List<Tiger_info> filteredTigers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(URLs.tigerDataAPI));
    if (response.statusCode == 200) {
      List<dynamic> tigerData = json.decode(response.body);
      setState(() {
        allTigers = tigerData.map((json) => Tiger_info.fromJson(json)).toList();
        filteredTigers = allTigers;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void filterTigers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTigers = allTigers;
      } else {
        filteredTigers = allTigers
            .where((tiger) => tiger.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TIGERS OF INDIA',
          style: GoogleFonts.muktaMalar().copyWith(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFFF8F4),
      ),
      backgroundColor: Color(0xFFFFF8F4),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: TextField(
              onChanged: filterTigers,
              decoration: InputDecoration(
                hintText: 'Search by Tiger Name',
                hintStyle: GoogleFonts.poppins().copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTigers.length,
              itemBuilder: (context, index) {
                final tiger = filteredTigers[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TigerDetailScreen(tiger: tiger),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            tiger.imageLink,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            tiger.name,
                            style: GoogleFonts.montserrat().copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
