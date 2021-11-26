import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 32,
                            ),
                            color: primaryColor,
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(padding_16),
                        child: Image.asset(
                          'assets/images/img_login_picture.png',
                          height: MediaQuery.of(context).size.height / 3.3,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(radius_30),
                                  topRight: Radius.circular(radius_30)),
                              color: primaryColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Login",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 36.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: padding_16),
                                      child: TextFormFieldWhite(
                                        label: "Email",
                                        isObscure: false,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: padding_16),
                                      child: TextFormFieldWhite(
                                        label: "Password",
                                        isObscure: true,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(buttonBlue),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(radius_12)))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: padding_8, horizontal: 32),
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.montserrat(
                                          color: blueTertiary,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
