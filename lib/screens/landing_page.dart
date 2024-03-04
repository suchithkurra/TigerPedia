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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // After 5 seconds, navigate to AuthenticationWrapper
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthenticationWrapper()),
      );
    });
  }
}