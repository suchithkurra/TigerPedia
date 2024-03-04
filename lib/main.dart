import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tigerapp/screens/bottom_nav.dart';
import 'package:tigerapp/screens/home_screen.dart';
import 'package:tigerapp/screens/login_screen.dart';
import 'package:tigerapp/screens/search_page.dart';
import 'package:tigerapp/screens/reserve_info.dart';
import 'package:tigerapp/screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/screens/tiger_info_screen.dart';
import 'package:tigerapp/Models/tiger_info.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottom_nav(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while checking authentication state
        }
        if (snapshot.hasData) {
          // User is signed in
          return bottom_nav();
        } else {
          // User is not signed in
          return LoginPage();
        }
      },
    );
  }
}

