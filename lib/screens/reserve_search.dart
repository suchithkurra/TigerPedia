import 'package:flutter/material.dart';
import 'package:tigerapp/Models/reserve_data.dart';
import 'package:tigerapp/Controllers/tiger_info_controller.dart';
import 'package:tigerapp/screens/reserve_info.dart';
import 'package:tigerapp/screens/reserve_info.dart';

import '../Controllers/reserve_info_controller.dart';

class ReserveSearchPage extends StatefulWidget {
  @override
  _ReserveSearchPageState createState() => _ReserveSearchPageState();
}

class _ReserveSearchPageState extends State<ReserveSearchPage> {
  late Future<List<TigerReserve>> _futureReserves;
  TextEditingController _searchController = TextEditingController();
  late Future<List<TigerReserve>> _filteredReserves;

  @override
  void initState() {
    super.initState();
    _futureReserves = TigerReserveController().fetchReserves();
    _filteredReserves = _futureReserves;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TIGER RESERVES',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFFF8F4),
      ),
      backgroundColor: Color(0xFFFFF8F4),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  _filteredReserves = _filterReserves(query);
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<TigerReserve>>(
              future: _filteredReserves,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final reserves = snapshot.data!;
                  return ListView.builder(
                    itemCount: reserves.length,
                    itemBuilder: (context, index) {
                      final reserve = reserves[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReserveDetailScreen(reserve: reserve),
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
                                child: Image.asset(
                                  'assets/reserve_placeholder.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  reserve.tigerReserve,
                                  style: TextStyle(
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
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<TigerReserve>> _filterReserves(String query) async {
    final reserves = await _futureReserves;
    return reserves.where((reserve) => reserve.tigerReserve.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
