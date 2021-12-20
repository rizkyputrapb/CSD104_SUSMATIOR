/*
Attributes
- Icons made by smashicons
*/
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/ui/screens/landing/landing_screen.dart';
import 'package:susmatior_app/ui/screens/main/main_screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void onStartTime() {
    const _duration = Duration(seconds: 2);
    Timer(_duration, navigationToLanding);
  }

  @override
  void initState() {
    onStartTime();
    super.initState();
  }

  void navigationToLanding() {
    FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
        try {
          if (user == null) {
            if (kDebugMode) {
              Navigator.pushReplacementNamed(
                context,
                LandingScreen.routeName,
              );
            }
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.routeName, (route) => false);
          }
        } catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
          return;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/img_splash_picture.png',
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Text(
                  'SUSMATIOR',
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Text(
                  'Suspicious Information\nObservers',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
