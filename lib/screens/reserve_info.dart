import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Models/reserve_data.dart';

class ReserveDetailScreen extends StatefulWidget {
  final TigerReserve reserve;

  ReserveDetailScreen({required this.reserve});

  @override
  _ReserveDetailScreenState createState() => _ReserveDetailScreenState();
}

class _ReserveDetailScreenState extends State<ReserveDetailScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.reserve.tigerReserve.toUpperCase()}',
          style: GoogleFonts.montserrat().copyWith(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Color(0xFFFFF8F4),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFFF8F4),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Your reserve details here
                  Text(
                    'Reserve Name: ${widget.reserve.tigerReserve}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Display other reserve details...
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Center(
              child: _buildDotsIndicator(),
            ),
          ),
          Positioned(
            top: 40,
            left: 17,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                Image.network(
                  widget.reserve.reserve_image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  widget.reserve.reserve_image2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  widget.reserve.reserve_image3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Add more images as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPageIndex == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
