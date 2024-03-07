import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tigerapp/screens/home_screen.dart';
import 'package:tigerapp/screens/login_screen.dart';
import 'package:tigerapp/screens/search_screen.dart';
import 'package:tigerapp/screens/reserve_search.dart';
import 'package:tigerapp/screens/profile_screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/screens/tiger_info_screen.dart';
import 'package:tigerapp/Models/tiger_info.dart';
import 'package:flutter_svg/flutter_svg.dart';






class bottom_nav extends StatefulWidget {
  final User user;

  const bottom_nav({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<bottom_nav> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      homepage(),
      SearchPage(),
      ReserveSearchPage(),
      profilepage(user: widget.user),
    ];
  }

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
              'assets/svg/Vectorhome-icon.svg',
              color: Color(0xFFF36523),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset('assets/svg/search-normalsearch-icon.svg',),
            activeIcon: SvgPicture.asset(
              'assets/svg/search-normalsearch-icon.svg',
              color: Color(0xFFF36523),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset('assets/svg/reserve-icon.svg',),
            activeIcon: SvgPicture.asset(
              'assets/svg/reserve-icon.svg',
              color: Color(0xFFF36523),
            ),
            label: 'Reserves',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset('assets/svg/profile.svg',),
            activeIcon: SvgPicture.asset(
              'assets/svg/profile.svg',
              color: Color(0xFFF36523),
            ),
            label: 'Account',
          ),
        ],
        selectedItemColor: Color(0xFFF36523),
        unselectedItemColor: Color(0xFFA9A9A9),
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
