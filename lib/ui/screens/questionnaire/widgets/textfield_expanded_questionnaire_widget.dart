import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';

class TextFormFieldExpandedBlue extends StatelessWidget {
  const TextFormFieldExpandedBlue(
      {Key? key,
      required this.label,
      required this.isObscure,
      required this.controller,
      this.validator})
      : super(key: key);

  final String label;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(color: const Color(0xFF2F2E41)),
      obscureText: isObscure,
      cursorColor: const Color(0xFF2F2E41),
      keyboardType: TextInputType.multiline,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: null,
      controller: controller,
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
