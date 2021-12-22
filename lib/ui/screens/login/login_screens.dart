import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:susmatior_app/constants/authstatus_enum.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';
import 'package:susmatior_app/provider/login_provider.dart';
import 'package:susmatior_app/ui/screens/main/main_screens.dart';
import 'package:susmatior_app/ui/screens/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidated = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(padding_16),
                        child: Image.asset(
                          'assets/images/img_login_picture.png',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.9,
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
                                      margin: const EdgeInsets.only(
                                          top: padding_16),
                                      child: _emailFormField(emailController),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: padding_16),
                                      child: TextFormFieldWhite(
                                        label: "Password",
                                        isObscure: true,
                                        controller: passwordController,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: padding_64),
                                  child: Consumer<LoginProvider>(
                                      builder: (context, provider, _) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  buttonBlue),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      radius_12),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (isValidated != true ||
                                              passwordController.text.isEmpty) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Please fill all of the information",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.grey
                                                    .withOpacity(0.75),
                                                textColor: Colors.white,
                                                timeInSecForIosWeb: 3,
                                                fontSize: 16.0);
                                          } else {
                                            provider.firebaseLogin(
                                                emailController.text,
                                                passwordController.text,
                                                context);
                                          }
                                          if (provider.state ==
                                              AuthResultStatus.successful) {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                MainScreen.routeName,
                                                (route) => false);
                                          } else if (provider.state ==
                                              AuthResultStatus.wrongPassword) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Please insert the correct password!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.grey
                                                    .withOpacity(0.75),
                                                textColor: Colors.white,
                                                timeInSecForIosWeb: 3,
                                                fontSize: 16.0);
                                          } else if (provider.state ==
                                              AuthResultStatus.userNotFound) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "User is not registered yet!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.grey
                                                    .withOpacity(0.75),
                                                textColor: Colors.white,
                                                timeInSecForIosWeb: 3,
                                                fontSize: 16.0);
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: padding_8,
                                              horizontal: padding_32),
                                          child: provider.state ==
                                                  AuthResultStatus.loading
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : Text(
                                                  "Login",
                                                  style: GoogleFonts.montserrat(
                                                    color: blueTertiary,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    );
                                  }),
                                )
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

  TextFormField _emailFormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.montserrat(color: Colors.white),
      cursorColor: Colors.white,
      validator: (value) {
        if (EmailValidator.validate(value!)) {
          isValidated = true;
          return null;
        } else {
          isValidated = false;
          return "Please insert a valid email address!";
        }
      },
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
