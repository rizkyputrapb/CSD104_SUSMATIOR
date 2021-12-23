import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPrimary({
    Key? key,
    required this.textTitle,
  }) : super(key: key);
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      title: Text(
        textTitle,
        style: GoogleFonts.montserrat(
          color: porcelainColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
