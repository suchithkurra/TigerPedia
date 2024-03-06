// profile_screen.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';


class profilepage extends StatelessWidget{
  final User user;

  profilepage({required this.user});

  @override
  Widget build(BuildContext context) {



    Size screenSize = MediaQuery.of(context).size;
    double profileWidth = screenSize.width * 0.9;
    double profileHeight = screenSize.height * 0.1;
    double personalwidth = screenSize.width * 0.9;
    double personalheight = screenSize.height * 0.5;
    double morewidth = screenSize.width * 0.9;
    double  moreheight= screenSize.height * 0.14;
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE', style: GoogleFonts.muktaMalar().copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 36
        ),),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF8F4),

      ),
      body: SingleChildScrollView(

        child: Container(
          color: const Color(0xFFFFF8F4),
          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                Container(
                  height: profileHeight,
                  width: profileWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0,3),
                        )
                      ]
                  ),


                  child: Center(
                    child: Row(
                       children: [
                         const SizedBox(width: 20,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: CircleAvatar(
                            backgroundImage: NetworkImage(user.photoURL ?? ''),
                            radius: 20,),
                         ),
                           const SizedBox(width: 20,),
                           Column(
                             children: [
                               const SizedBox(height: 10),
                               Padding(
                                 padding: const EdgeInsets.all(4.0),
                                 child: Text(user.displayName ?? '', style: GoogleFonts.dmSans().copyWith(
                                   fontSize: 14
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(4.0),
                                 child: Text(user.email ?? '', style: GoogleFonts.dmSans().copyWith(
                                   fontSize: 14
                                 ),),
                               ),
                             ],
                           ),


                       ],
                     ),
                  ),
                ),
                Column(

                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(

                      padding: const EdgeInsets.all(12.0),
                      child: Text('Personal Details', style: GoogleFonts.dmSans().copyWith(
                        fontSize: 14
                      ),),
                    ),

                    Flexible(
                      child: Container(
                       // height: personalheight,
                        width: personalwidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 7,
                                offset: const Offset(0,3),
                                  color: Colors.grey.withOpacity(0.3)
                              )
                            ]
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ListTile(
                              leading: SvgPicture.asset('assets/svg/account_privacy.svg'),
                              title: Text('Account Privacy', style: GoogleFonts.poppins().copyWith(
                                fontSize: 12
                              ),),
                              trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                              onTap: () {
                                print('Button 1 tapped');
                              }
                            ),
                            ListTile(
                              leading: SvgPicture.asset('assets/svg/feedback.svg'),
                              title: Text('Send Us your Feedback', style: GoogleFonts.poppins().copyWith(
                                fontSize: 12
                              ),),
                                onTap: () {print('Button 1 tapped');},
                              trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                            ListTile(
                              leading: SvgPicture.asset('assets/svg/share.svg'),
                              title: Text('Share with your Friends', style: GoogleFonts.poppins().copyWith(
                                fontSize: 12
                              ),),
                                onTap: () {
                                  print('Button 1 tapped');
                                },
                              trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                        ListTile(
                          leading: SvgPicture.asset('assets/svg/website.svg'),
                          title: Text('Our Website', style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12
                                ),),
                            onTap: () {
                              print('Button 1 tapped');
                            },
                          trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                        ListTile(
                          leading: SvgPicture.asset('assets/svg/notifications.svg'),
                          title: Text('Team', style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12
                              ),),
                            onTap: () {
                              print('Button 1 tapped');
                            },
                          trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                        ListTile(
                          leading: const Icon(Icons.signal_cellular_connected_no_internet_4_bar
                          ),
                          title: Text('Sign Out', style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12
                              ),),
                            onTap: () {
                              print('Button 1 tapped');
                            },
                          trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                        ListTile(
                          leading: const Icon(Icons.manage_accounts_outlined
                              ),
                          title: Text('Developers', style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12
                              ),),
                              onTap: () {
                                print('Button 1 tapped');
                              },
                          trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                      
                          ],
                        ),
                      
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('More', style: GoogleFonts.dmSans().copyWith(
                          fontSize: 14
                      ),),
                    ),
                    Flexible(
                      child: Container(
                        // height: moreheight,
                        width: morewidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 7,
                              blurRadius: 7,
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(0,3)
                            )
                          ]
                        ),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                      
                            ListTile(
                              leading: const Icon(Icons.signal_cellular_connected_no_internet_4_bar
                              ),
                              title: Text('About Us', style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12
                              ),),
                              onTap: () {
                                print('Button 1 tapped');
                              },
                              trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                            ),
                              ListTile(
                                leading: const Icon(Icons.help_center
                                ),
                                title: Text('Help & Support', style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12
                                ),),
                                onTap: () {
                                  print('Button 1 tapped');
                                },
                                trailing: SvgPicture.asset('assets/svg/right_arrow.svg'),
                              ),
                      
                      
                          ]
                        )
                      
                            ),
                    ),
                    const SizedBox(height: 20,)
                        ],
                      )
                    ],
                  ),
                )



        ),
            ),

          );



  }
}
