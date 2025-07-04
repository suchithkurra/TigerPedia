import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Models/tiger_info.dart';
import 'package:tigerapp/controllers/tiger_info_controller.dart';
import 'package:tigerapp/screens/tiger_info_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<tiger_information>> _futureTigers;
  TextEditingController _searchController = TextEditingController();
  late Future<List<tiger_information>> _filteredTigers;
  List<String> _selectedFilters = []; // Define _selectedFilter
  List<String> _filterOptions = [
    'Tadoba Andhari Tiger Reserve',
    'Reserve 2',
    'Reserve 3',
    // Add more reserve options as needed
  ];

  @override
  void initState() {
    super.initState();
    _futureTigers = TigerInfoController().fetchTigers();
    _filteredTigers = _futureTigers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TIGERS OF INDIA',
          style: GoogleFonts.muktaMalar(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFFF8F4),
      ),
      backgroundColor: Color(0xFFFFF8F4),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
                children: [


             Container(
            height: MediaQuery.sizeOf(context).height * 0.07,
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white, // Adjust color as needed
        borderRadius: BorderRadius.circular(12.0),
      ),
             // Provide a specific width
               child: TextField(
                 controller: _searchController,
                 decoration: InputDecoration(
                     hintText: 'Search',hintStyle: GoogleFonts.poppins(),

                     prefixIcon: Padding(
                       padding: const EdgeInsets.only(top:5),
                       child: Icon(Icons.search),
                     ),

                     border: InputBorder.none
                 ),



                onChanged: (query) {
                      setState(() {
                        _filteredTigers = _filterTigers(query);
                      });
                    },
                  ),
                ),

                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                  GestureDetector(
                    onTap: () {
                      _showFilterBottomSheet(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      width: MediaQuery.sizeOf(context).width * 0.1,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/svg/filter_icon.svg'),
                      ),
                    ),
                  ),

                ],
              ),
            ),


          Expanded(
            child: FutureBuilder<List<tiger_information>>(
              future: _filteredTigers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final tigers = snapshot.data!;
                  return ListView.builder(
                    itemCount: tigers.length,
                    itemBuilder: (context, index) {
                      final tiger = tigers[index];
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
                          // padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0), // Adjust border radius if needed
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                  child: Image.network(
                                    tiger.imageLink,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
                              Expanded(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tiger.name,
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
                                              tiger.tigerReserve,
                                              style: GoogleFonts.montserrat().copyWith(
                                                fontSize: 12,
                                            
                                              ),
                                            ),
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

  Future<List<tiger_information>> _filterTigers(String query) async {
    final tigers = await _futureTigers;
    if (_selectedFilters.isNotEmpty) {
      return tigers.where((tiger) =>
      tiger.name.toLowerCase().contains(query.toLowerCase()) &&
          _selectedFilters.contains(tiger.tigerReserve.toLowerCase())).toList();
    } else {
      return tigers.where((tiger) =>
          tiger.name.toLowerCase().contains(query.toLowerCase())).toList();
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
                  'Filter by Reserve',
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
                          if (_selectedFilters.contains(option.toLowerCase())) {
                            _selectedFilters.remove(option.toLowerCase());
                          } else {
                            _selectedFilters.add(option.toLowerCase());
                          }
                          _filteredTigers = _filterTigers(_searchController.text);
                        });
                        print('Filtered Tigers: $_filteredTigers'); // Debugging print
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      leading: _selectedFilters.contains(option.toLowerCase())
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
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
