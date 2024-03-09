import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigerapp/Models/tiger_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TigerDetailScreen extends StatefulWidget {
  final tiger_information tiger;

  TigerDetailScreen({required this.tiger});

  @override
  _TigerDetailScreenState createState() => _TigerDetailScreenState();
}

class _TigerDetailScreenState extends State<TigerDetailScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  late YoutubePlayerController _controller;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controller = YoutubePlayerController(
      initialVideoId: widget.tiger.tiger_youtube_id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year; // Get the current year
    int birthYear = widget.tiger.born; // Assuming 'tiger.born' represents the birth year of the tiger
    int age = currentYear - birthYear;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      Image.network(
                        widget.tiger.imageLink,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.tiger.imageLink2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.tiger.imageLink3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                        progressColors: ProgressBarColors(
                          playedColor: Colors.white,
                          handleColor:  Color(0xFFFFF8F4),
                        ),
                        onReady: () {
                          print('Player is ready.');
                        },
                      ),

                    ],
                  ),
                ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 10,
        child: Center(
          child: _buildDotsIndicator(),
        ),),
                Positioned(
                  top: 40,
                  left: 17,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

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
                              '${widget.tiger.tigerCode.substring(2).toUpperCase()}',
                              style: GoogleFonts.irishGrover().copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20), // Adjust spacing between the tiger code box and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.tiger.name}',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('${widget.tiger.tigerReserve}',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontWeight: FontWeight.w300, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('${widget.tiger.details}',
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
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F7F9),
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                        ),
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text('${widget.tiger.name}',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 16, fontWeight: FontWeight.w400)),
                              Text('Born ${widget.tiger.born}',
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

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 15.0,
          height: 5.0,
          margin: EdgeInsets.symmetric(horizontal: 0.3),
          child: Stack(
            children: [
              Container(
                width: 10.0,
                height: 10.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: _currentPageIndex == index ? 1.0 : 0.0,
                    child: Container(
                      width: 30.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }



  Widget _buildSelectedDot() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // Adjust radius as needed
      child: Container(
        width: 10.0,
        height: 10.0,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildUnselectedDot() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }


  








  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
