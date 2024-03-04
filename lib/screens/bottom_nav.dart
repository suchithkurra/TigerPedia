import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tigerapp/screens/home_screen.dart';
import 'package:tigerapp/screens/login_screen.dart';
import 'package:tigerapp/screens/search_page.dart';
import 'package:tigerapp/screens/reserve_info.dart';
import 'package:tigerapp/screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/screens/tiger_info_screen.dart';
import 'package:tigerapp/Models/tiger_info.dart';
import 'package:flutter_svg/flutter_svg.dart';






class bottom_nav extends StatefulWidget {
  const bottom_nav({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<bottom_nav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    homepage(),
    SearchPage(),
    ReserveInfoPage(),
    profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(




        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.black87,
        currentIndex: _currentIndex,
        onTap: (index) {
      setState(() {
        _currentIndex = index;
      });
    },
    items: [
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: SvgPicture.asset('assets/svg/home-2.svg',),
    activeIcon: SvgPicture.asset(
    'assets/svg/Vectorhome-icon.svg', // Replace with the path to your selected icon
    color: Color(0xFFF36523), // Customize the color for the selected state
    ),
    label: 'Home',

    ),

    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: SvgPicture.asset('assets/svg/search-normalsearch-icon.svg',),
    activeIcon: SvgPicture.asset(
    'assets/svg/search-normalsearch-icon.svg', // Replace with the path to your selected icon
    color: Color(0xFFF36523), // Customize the color for the selected state
    ),
    label: 'Search',
    ),
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: SvgPicture.asset('assets/svg/reserve-icon.svg',),
    activeIcon: SvgPicture.asset(
    'assets/svg/reserve-icon.svg', // Replace with the path to your selected icon
    color: Color(0xFFF36523), // Customize the color for the selected state
    ),

    label: 'Reserves',


    ),
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: SvgPicture.asset('assets/svg/profile.svg',),
    activeIcon: SvgPicture.asset(
    'assets/svg/profile.svg', // Replace with the path to your selected icon
    color: Color(0xFFF36523), // Customize the color for the selected state
    ),
    label: 'Account',
    ),
    ],
    selectedItemColor: Color(0xFFF36523), // Set the color for the selected item's label
    unselectedItemColor: Color(0xFFA9A9A9),
    selectedLabelStyle: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    // color: Colors.blue, // Change the color of the selected label text
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    // color: Colors.black, // Change the color of the unselected label text
    ),

        )
    );
  }
}