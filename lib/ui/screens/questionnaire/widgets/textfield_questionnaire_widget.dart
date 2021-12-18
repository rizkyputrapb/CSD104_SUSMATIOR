import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';

class TextFormFieldBlue extends StatelessWidget {
  const TextFormFieldBlue(
      {Key? key,
      required this.label,
      required this.isObscure,
      required this.controller,
      required this.keyboardType,
      this.validator})
      : super(key: key);
  final String label;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isObscure,
      cursorColor: charadeColor,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: GoogleFonts.montserrat(
        color: charadeColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(color: primaryColor),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: primaryColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: primaryColor)),
      ),
    );
  }
}
