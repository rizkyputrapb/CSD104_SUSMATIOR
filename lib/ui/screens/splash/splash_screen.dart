/*
Attributes
- Icons made by smashicons
*/
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/ui/screens/landing/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        print("firebase is initialized");
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void onStartTime() {
    const _duration = Duration(seconds: 2);
    Timer(_duration, navigationToLanding);
  }

  @override
  void initState() {
    initializeFlutterFire();
    onStartTime();
    super.initState();
  }

  void navigationToLanding() {
    Navigator.pushReplacementNamed(
      context,
      LandingScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (() {
          if(_error) {
            return const SnackBar(content: Text("Error initializing firebase"));
          }
          return Center(
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
          );
        }()),
      ),
    );
  }
}
