import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landing_screen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/img_splash_picture.png',
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 2.2,
            ),
            Text(
              'Prevent others from falling to scams',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: primaryColor,
                fontSize: 36.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Report scam numbers so other people will be saved from scams with your information!',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Ink(
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: Color(0xFFE8EDFC),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 56.0,
                    child: MaterialButton(
                      onPressed: () {},
                      color: Color(0xFF7FACFA),
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(12.0),
                          right: Radius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 56.0,
                    child: MaterialButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, HomeScreen.routeName),
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF80B2FF),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
