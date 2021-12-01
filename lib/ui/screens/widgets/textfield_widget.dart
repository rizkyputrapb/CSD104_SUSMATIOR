import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextFormFieldWhite extends StatelessWidget {
  const EmailTextFormFieldWhite({Key? key, TextEditingController? controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (value) =>
          EmailValidator.validate(value!) ? null : "Please enter a valid email",
      decoration: const InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
      ),
    );
  }
}

class TextFormFieldWhite extends StatelessWidget {
  const TextFormFieldWhite(
      {Key? key,
      TextEditingController? controller,
      required this.label,
      required this.isObscure})
      : super(key: key);

  final String label;
  final bool isObscure;

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
