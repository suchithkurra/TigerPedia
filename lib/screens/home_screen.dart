import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tigerapp/Models/tiger_info.dart';
import 'dart:ui';
import 'package:blur/blur.dart';

import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late Future<List<tiger_information>> _futureTigerInfoList;

  @override
  void initState() {
    super.initState();
    _futureTigerInfoList = fetchTigerInfoList(); // Call your function to fetch tiger info list
  }

  Future<List<tiger_information>> fetchTigerInfoList() async {
    final response = await http.get(Uri.parse('http://api.tigerpedia.in:8000/get_carousel_slider_data_mysql/')); // Replace 'your_endpoint_url' with your actual endpoint URL

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> jsonData = json.decode(response.body);
      List<tiger_information> tigerInfoList = jsonData.map((json) => tiger_information.fromJson(json)).toList();
      return tigerInfoList;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load tiger info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make app bar transparent
          elevation: 0, // Remove app bar shadow
          centerTitle: true,
          title: Text(
            'TIGERPEDIA',
            style: GoogleFonts.montserrat().copyWith(
              color: Colors.black, // Set text color
              fontSize: 20, // Set text size
              fontWeight: FontWeight.w800, // Set text weight
            ),
          ),
        ),

        body: Stack(
                children:[
                  Align(
                        alignment: Alignment(-0.4, 0.5), // Align the center of the circle to the top-left corner
                        child: Transform.translate(
                          offset: Offset(-120, -430), // Move the circle to position its center at the top-left corner
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 1000.0, sigmaY: 1000.0),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/ellipse_colour.png',
                                  height: 266,
                                  width: 304,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                Positioned(
                    top: 100, // Adjust this value to position the carousel as desired
                    left: 0,
                    right: 0,
                    child: FutureBuilder<List<tiger_information>>(
                        future: _futureTigerInfoList,
                        builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                          } else {
                          List<tiger_information>? tigerInfoList = snapshot.data;
                          if (tigerInfoList != null && tigerInfoList.isNotEmpty) {
                          return Container(
                          height: 1000, // Adjust this height as needed
                              child: HorizontalCarousel(tigerInfoList: tigerInfoList),
                           );
                          } else {
                          return Center(child: Text('No tiger info available'));
    }
    }
    },
    ),
    ),
    ],
    ),

    );
  }
}

    // backgroundColor: Colors.yellow


class HorizontalCarousel extends StatefulWidget {
  final List<tiger_information> tigerInfoList;

  HorizontalCarousel({required this.tigerInfoList});

  @override
  _HorizontalCarouselState createState() => _HorizontalCarouselState();
}

class _HorizontalCarouselState extends State<HorizontalCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 230.0,
          viewportFraction: 0.8,
          enableInfiniteScroll: false,
          aspectRatio: 2.0,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
          initialPage: 0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: widget.tigerInfoList.map((tiger) {
          int currentIndex = widget.tigerInfoList.indexOf(tiger);
          bool isCentered = _currentIndex == currentIndex;
          double scale = isCentered ? 1.0 : 0.8;
          double marginLeft = isCentered ? 0 : 20;

          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: cardWidth,
                margin: EdgeInsets.symmetric(horizontal: marginLeft),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: cardWidth,
                        decoration: BoxDecoration(
                          color: isCentered ? Colors.amber : Colors.grey,
                        ),
                         child: Image.network(
                         tiger.imageLink,
                         width: double.infinity,
                         height: double.infinity,
                         fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Opacity(
                          opacity: isCentered ? 1.0 : 0.0,
                          child: Text(
                            tiger.name,
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 19.26,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
