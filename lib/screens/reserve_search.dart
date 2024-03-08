import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String _selectedFilter = ''; // Define _selectedFilter
  List<String> _filterOptions = [
    'Karnataka',
    'Uttarakhand',
    'Uttar Pradesh',
    'Madhya Pradesh',
    'Assam',
    'Maharashtra',
    'Jharkhand',
    'Rajasthan',
    'Orissa',
    'West Bengal',
    'Kerala',
    'Chattisgarh',
    'Arunachal Pradesh',
    'Andhra Pradesh',
    'Tamil Nadu',
    'Bihar',
    'Mizoram',
    'Telangana',
  ]; // Define _filterOptions


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
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'TIGER RESERVES',
            style: GoogleFonts.muktaMalar(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),

        backgroundColor: Color(0xFFFFF8F4),
      ),
      backgroundColor: Color(0xFFFFF8F4),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: [
                Container(

                  height: MediaQuery.sizeOf(context).height * 0.07,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust color as needed
                    borderRadius: BorderRadius.circular(12.0),),

                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none
                    ),
                    onChanged: (query) {
                      setState(() {
                        _filteredReserves = _filterReserves(query);
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    _showFilterBottomSheet(context);
                  },
                ),
              ],
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
                          // padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  ),
                                  child: Image.network(
                                    reserve.reserve_image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      reserve.tigerReserve,
                                      style: GoogleFonts.montserrat().copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.symmetric(vertical: 1),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/svg/location_vector.svg'),
                                          SizedBox(width: MediaQuery.sizeOf(context).width * 0.01,),
                                          Text(
                                            reserve.state,
                                            style: GoogleFonts.montserrat().copyWith(
                                              fontSize: 12,

                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
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
    if (_selectedFilter.isNotEmpty) {
      // Filter by both state and search query
      return reserves.where((reserve) =>
      reserve.state.toLowerCase() == _selectedFilter.toLowerCase() &&
          reserve.tigerReserve.toLowerCase().contains(query.toLowerCase())
      ).toList();
    } else {
      // Only filter by search query
      return reserves.where((reserve) =>
          reserve.tigerReserve.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Filter by State',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filterOptions.length,
                  itemBuilder: (context, index) {
                    final option = _filterOptions[index];
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        print('Filter selected: $option'); // Debugging print
                        setState(() {
                          _selectedFilter = option;
                          _filteredReserves = _filterReserves(_searchController.text);
                        });
                        print('Filtered Reserves: $_filteredReserves'); // Debugging print
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }



}


