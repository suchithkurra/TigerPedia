import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tigerapp/main.dart';
import 'package:tigerapp/screens/home_screen.dart';
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
}