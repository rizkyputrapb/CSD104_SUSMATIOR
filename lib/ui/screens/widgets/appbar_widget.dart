import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  AppBarPrimary({
    Key? key,
    required this.textTitle,
  }) : super(key: key);
  String textTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF4F9F9),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color(0xFF428DFF),
      ),
      title: Text(
        textTitle,
        style: GoogleFonts.montserrat(
          color: Color(0xFF2F2E41),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
