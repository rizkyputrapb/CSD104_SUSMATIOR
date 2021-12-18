import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/provider/account_provider.dart';
import 'package:susmatior_app/ui/screens/account/widgets/card_avatar_widget.dart';
import 'package:susmatior_app/ui/screens/account/widgets/card_widget.dart';
import 'package:susmatior_app/ui/screens/landing/landing_screen.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/btn_expanded_widget.dart';
import 'package:susmatior_app/util/firebase_auth_helper.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(
        textTitle: 'Account',
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Consumer<AccountProvider>(
              builder: (context, provider, _) {
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(provider.user!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          CardAvatarAccount(
                            childText: 'Change Photo Profile',
                            firstName: snapshot.data!['firstname'],
                            lastName: snapshot.data!['lastname'],
                            widgetImage: snapshot.data!['profile-picture'] == ""
                                ? Image.asset("assets/icons/ic_user_scam.png")
                                : CachedNetworkImage(
                                    imageUrl: snapshot.data!['profile-picture'],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover,
                                  ),
                            onPressed: () async {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(provider.user?.uid)
                                  .update({
                                'profile-picture':
                                    await provider.changeImageProfile()
                              });
                            },
                          ),
                          CardAccount(
                            titleText: 'Email',
                            childText: snapshot.data!['email'],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(padding_8),
                            child: ButtonRectangleExpanded(
                              onTap: () async {
                                FirebaseAuthHelper().logout();
                                await Navigator.pushNamedAndRemoveUntil(context,
                                    LandingScreen.routeName, (route) => false);
                              },
                              textButton: 'Logout',
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Unknown');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
