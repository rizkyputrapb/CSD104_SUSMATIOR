import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/padding_constants.dart';

class ButtonRectangleExpanded extends StatelessWidget {
  ButtonRectangleExpanded({
    Key? key,
    required this.textButton,
  }) : super(key: key);
  String textButton;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(padding_16),
      decoration: const BoxDecoration(
        color: Color(0xFF428DFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8.0),
          right: Radius.circular(8.0),
        ),
      ),
      child: Text(
        textButton,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
