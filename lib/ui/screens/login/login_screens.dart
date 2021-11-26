import 'package:flutter/material.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: primaryColor,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(padding_16),
            child: Image.asset(
              'assets/images/img_login_picture.png',
              height: MediaQuery.of(context).size.height / 4,
            ),
          ),
        ],
      ),
    );
  }
}
