import 'package:flutter/material.dart';
import 'package:tigerapp/screens/home_screen.dart';
import 'package:tigerapp/screens/search_page.dart';
import 'package:tigerapp/screens/reserve_info.dart';
import 'package:tigerapp/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const bottom_nav(),
    );
  }
}

class bottom_nav extends StatefulWidget {
  const bottom_nav({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<bottom_nav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    homepage(),
    searchpage(),
    reserveinfopage(),
    profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tigers of India'),
        actions: [
          IconButton(

              onPressed: (){
                Scaffold.of(context).openEndDrawer();
              }, icon: Icon(Icons.menu))
        ],
      ),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: 'Tiger Reserve Info',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      endDrawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Implement your drawer item functionality here
              },
            ),
            ListTile(
              title: Text('Drawer Item 2'),
              onTap: () {
                // Implement your drawer item functionality here
              },
            ),
            // Add more ListTile widgets for additional items
          ],
        ),
      )

    );

  }
}
