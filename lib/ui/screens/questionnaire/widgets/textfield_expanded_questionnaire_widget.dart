import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldExpandedBlue extends StatelessWidget {
  const TextFormFieldExpandedBlue({
    Key? key,
    required this.label,
    required this.isObscure,
    required this.controller,
    this.validator
  }) : super(key: key);

  final String label;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(color: Color(0xFF2F2E41)),
      obscureText: isObscure,
      cursorColor: Color(0xFF2F2E41),
      keyboardType: TextInputType.multiline,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: null,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(color: Color(0xFF428DFF)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF428DFF))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF428DFF))),
      ),
    );
  }
}
