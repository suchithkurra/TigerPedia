import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tigerapp/main.dart';
import 'package:tigerapp/screens/home_screen.dart';
import 'package:tigerapp/screens/login_screen.dart';
import 'data.dart';
import 'package:tigerapp/screens/bottom_nav.dart';
import 'package:tigerapp/Models/profile_class.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential result = await _auth.signInWithCredential(credential);
        final User? userDetails = result.user;

        if (userDetails != null) {
          final userinfoMap = {
            "email": userDetails.email,
            "name": userDetails.displayName,
            "imageURL": userDetails.photoURL,
            "id": userDetails.uid,
          };

          await Data().addUser(userDetails.uid, userinfoMap);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom_nav(user: userDetails)));
        }
      }
    } catch (error) {
      print("Error signing in with Google: $error");
      // Handle error (show snackbar, toast, etc.)
    }

  }
  Future<void> signOut(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Show a confirmation dialog
      bool confirmSignOut = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFFFF8F4),
            title: Text('Confirm Sign Out', style: GoogleFonts.poppins()),
            content: Text('Are you sure you want to sign out?', style: GoogleFonts.poppins()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Return false if user cancels
                },
                child: Text('Cancel', style: GoogleFonts.poppins()
                )),

              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Return true if user confirms
                },
                child: Text('Sign Out', style: GoogleFonts.poppins()

                ),),

            ],
          );
        },
      );

      // If the user confirms sign-out, proceed
      if (confirmSignOut == true) {
        await googleSignIn.signOut(); // Sign out from Google
        await _auth.signOut(); // Sign out from Firebase Auth

        // Check if there are any routes in the navigator's history
        if (Navigator.of(context).canPop()) {
          // If there are routes, pop the navigator
          Navigator.pop(context);
        } else {
          // If there are no routes, navigate to the home screen or any other appropriate screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()), // Replace SignInScreen with your desired screen
          );
        }
      }
    } catch (error) {
      print("Error signing out: $error");
      // Handle error (show snackbar, toast, etc.)
    }
  }
}
