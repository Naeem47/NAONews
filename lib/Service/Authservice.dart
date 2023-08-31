import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news/View/HomeView.dart';
import 'package:news/View/LoginView.dart';

class AuthService {
  var auth = FirebaseAuth.instance;
  handleGoogleLogin(context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gauth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken, idToken: gauth.idToken);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView(),));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  logout(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView(),));

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    
  }
}
