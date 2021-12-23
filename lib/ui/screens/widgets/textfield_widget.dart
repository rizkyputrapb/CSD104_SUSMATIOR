import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWhite extends StatelessWidget {
  const TextFormFieldWhite(
      {Key? key, this.controller, required this.label, required this.isObscure})
      : super(key: key);

  final String label;
  final bool isObscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: isObscure,
      cursorColor: Colors.white,
      validator: (value) =>
          value!.isNotEmpty || value != "" ? null : "Please fill this field",
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
      ),
    );
  }
}
