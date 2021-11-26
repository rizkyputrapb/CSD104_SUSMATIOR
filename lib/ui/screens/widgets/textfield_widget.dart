import 'package:flutter/material.dart';

class TextFormFieldWhite extends StatelessWidget {
  TextFormFieldWhite(
      {Key? key,
        TextEditingController? controller,
        required this.label,
        required this.isObscure})
      : super(key: key);

  String label;
  bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      obscureText: isObscure,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white)),
      ),
    );
  }
}