import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page.dart';

class GoogleSign {
  static void googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    if (googleSignInAccount == null) throw Exception('No Logged In');

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final usercredential = await FirebaseAuth.instance.signInWithCredential(credential);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('login', true);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
  }
}
