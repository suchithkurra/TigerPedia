import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us', style: GoogleFonts.poppins(),),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF8F4),
      ),
      body: Container(
        color: const Color(0xFFFFF8F4),
        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'About Us Page',
                style: GoogleFonts.poppins().copyWith(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Add your content here...',
                style: GoogleFonts.poppins().copyWith(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
