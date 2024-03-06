import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Controllers/auth.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 0.9;
    double containerHeight = screenSize.height * 0.6;
    double googlewidth = screenSize.width * 0.7;
    double googleheight = screenSize.height * 0.06;
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFF8F4),
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/TigerPedia_login_Logo.png'),
              const SizedBox(height: 20,),
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
                      offset: const Offset(0, 3),
                ),
                ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 40,),
                    Padding(padding: const EdgeInsets.all(20),
                        child: Text('Welcome to', style: GoogleFonts.dmSans().copyWith(
                      fontSize: 24,
                    )
                    ),
                    ),
                    Padding(padding: const EdgeInsets.all(20),
                        child: Image.asset('assets/images/TigerPedia_login_Text.png'),
                              ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding:  const EdgeInsets.all(30.0),
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
                          child: Container(
                            height: googleheight,
                              width: googlewidth,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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

                             const SizedBox(width: 20 ),
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
                    )
                        ]

                              ),
          )
            ],

          ),
        ),
      )
    );
  }
}
