import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tigerapp/Controllers/auth.dart';
import 'package:tigerapp/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:tigerapp/Controllers/auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 0.9;
    double containerHeight = screenSize.height * 0.6;
    double googlewidth = screenSize.width * 0.7;
    double googleheight = screenSize.height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(

      child: Container(
        color: Color(0xFFFFF8F4),
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset('assets/images/TigerPedia_login_Logo.png')
              ),
              SizedBox(height: 20,),
              Container(
                height: containerHeight,
                width: containerWidth,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                ),
                ]
                ),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  
                    children: [
                      SizedBox(height: 40,),
                      Padding(padding: EdgeInsets.all(20),
                          child: Text('Welcome to', style: GoogleFonts.dmSans().copyWith(
                        fontSize: 24,
                      )
                      ),
                      ),
                      Padding(padding: EdgeInsets.all(20),
                          child: Image.asset('assets/images/TigerPedia_login_Text.png'),
                                ),
                      SizedBox(height: 10,),
                      Padding(
                        padding:  EdgeInsets.all(30.0),
                        child: Text('A Place Where you can track all the Tiger Reserves in India', style: GoogleFonts.dmSans().copyWith(
                          fontSize: 16
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Let's Get Started...", style: GoogleFonts.dmSans().copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      GestureDetector(
                    onTap: () {
                      AuthMethods().signInWithGoogle(context);
                    },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Expanded(
                            child: Container(
                              height: googleheight,
                                width: googlewidth,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                  color: Colors.black87,
                                    width: 2
                            )
                                                ),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                            children: [
                  
                              Image.asset('assets/images/google.png'),
                  
                               SizedBox(width: 20 ),
                              Text(
                                'Sign in with Google',
                                style: GoogleFonts.inter().copyWith(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                  
                            ],
                                                ),
                                              ),
                          ),
                        ),
                  ),
                      )
                          ]

                                ),
                ),
    )
            ],

          ),
        ),
      ),
      )
    );
  }
}
