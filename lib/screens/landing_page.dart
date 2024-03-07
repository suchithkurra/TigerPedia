import 'dart:async';

import 'package:flutter/material.dart';

import '../Controllers/authentication_wrapper.dart';
import '../main.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: const Color(0xFFFFF8F4),
        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Image.asset('assets/images/TigerPedia_login_Logo.png'),
               SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
               Image.asset('assets/images/TigerPedia_login_Text.png'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04,),
               CircularProgressIndicator()
            ],
          )
          ,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // After 5 seconds, navigate to AuthenticationWrapper
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthenticationWrapper()),
      );
    });
  }
}