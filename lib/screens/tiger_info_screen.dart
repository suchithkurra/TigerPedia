import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Models/tiger_info.dart';
 // Import the Tiger_info class

class TigerDetailScreen extends StatelessWidget {
  final tiger_information tiger;

  TigerDetailScreen({required this.tiger});

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year; // Get the current year
    int birthYear = tiger.born; // Assuming 'tiger.born' represents the birth year of the tiger
    int age = currentYear - birthYear;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (tiger.imageLink != null)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    child: Image.network(
                      tiger.imageLink,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                Positioned(
                  top: 40, // Adjust the top position as needed
                  left: 17, // Adjust the left position as needed
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Container(
              color: Color(0xFFFFF8F4),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        height: 67,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F7F9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'T',
                              style: GoogleFonts.irishGrover().copyWith(fontSize: 20),
                            ),
                            Text(
                              '${tiger.tigerCode.substring(2).toUpperCase()}',
                              style: GoogleFonts.irishGrover().copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20), // Adjust spacing between the tiger code box and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${tiger.name}',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('${tiger.tigerReserve}',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontWeight: FontWeight.w300, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('${tiger.details}',
                        style: GoogleFonts.montserrat().copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 92,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 18, // Adjust font size as needed
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$age', // Assuming 'age' is a variable containing the age value
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 18, // Adjust font size as needed
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F7F9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text('${tiger.name}',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 16, fontWeight: FontWeight.w400)),
                              Text('Born ${tiger.born}',
                                  style: GoogleFonts.poppins().copyWith(fontSize: 10)),
                              Text('Eastern India',
                                  style: GoogleFonts.poppins().copyWith(fontSize: 8)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
