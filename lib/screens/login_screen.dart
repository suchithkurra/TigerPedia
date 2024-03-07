import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Controllers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 0.9;
    double containerHeight = screenSize.height * 0.6;
    double googlewidth = MediaQuery.of(context).size.width * 0.7;
    double googleheight = screenSize.height * 0.06;
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFF8F4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset('assets/images/TigerPedia_login_Logo.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Flexible(
                child: Container(
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
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Welcome to',
                          style: GoogleFonts.dmSans().copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Image.asset('assets/images/TigerPedia_login_Text.png'),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'A Place Where you can track all the Tiger Reserves in India',
                          style: GoogleFonts.dmSans().copyWith(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Let's Get Started...",
                          style: GoogleFonts.dmSans().copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await AuthMethods().signInWithGoogle(context);
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Container(
                              height: googleheight,
                              width: googlewidth,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black87,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/google.png'),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
