import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';
import 'package:susmatior_app/ui/screens/widgets/textfield_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: primaryColor
        ),
      ),
      body: LayoutBuilder(
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
                        'assets/images/img_register_picture.png',
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
                                    "Are you ready to be a hero?",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: padding_16,
                                              right: padding_8),
                                          child: const TextFormFieldWhite(
                                            label: "First Name",
                                            isObscure: false,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: padding_16,
                                              left: padding_8),
                                          child: const TextFormFieldWhite(
                                            label: "Last Name",
                                            isObscure: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: padding_16),
                                    child: EmailTextFormFieldWhite(),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: padding_16),
                                    child: const TextFormFieldWhite(
                                      label: "Password",
                                      isObscure: true,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: padding_16),
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                buttonBlue),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        radius_12)))),
                                    onPressed: () => Navigator.pushNamed(
                                        context, HomeScreen.routeName),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: padding_8,
                                          horizontal: 32),
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.montserrat(
                                          color: blueTertiary,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
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
    );
  }
}
