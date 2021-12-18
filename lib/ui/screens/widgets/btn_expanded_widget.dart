import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';

class ButtonRectangleExpanded extends StatelessWidget {
  const ButtonRectangleExpanded({
    Key? key,
    required this.textButton,
    required this.onTap,
  }) : super(key: key);
  final String textButton;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(padding_16),
        decoration: const BoxDecoration(
          color: primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(radius_8),
            right: Radius.circular(radius_8),
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
      ),
    );
  }
}
