import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/ui/screens/account/widgets/card_avatar_widget.dart';
import 'package:susmatior_app/ui/screens/account/widgets/card_widget.dart';
import 'package:susmatior_app/ui/screens/landing/landing_screen.dart';
import 'package:susmatior_app/ui/screens/login/login_screens.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/btn_expanded_widget.dart';
import 'package:susmatior_app/util/firebase_auth_helper.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        textTitle: 'Account',
      ),
      body: ListView(
        children: [
          CardAvatarAccount(
            imageUserAccount: 'assets/icons/ic_user_scam.png',
            titleText:
                FirebaseAuth.instance.currentUser!.displayName.toString(),
            childText: 'Change Photo Profile',
          ),
          CardAccount(
            titleText: 'Email',
            childText: FirebaseAuth.instance.currentUser!.email.toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(padding_8),
            child: InkWell(
              onTap: () {
                FirebaseAuthHelper().logout();
                Navigator.pushReplacementNamed(
                    context, LandingScreen.routeName);
              },
              child: ButtonRectangleExpanded(textButton: 'Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
