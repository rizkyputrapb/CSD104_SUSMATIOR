import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:susmatior_app/provider/account_provider.dart';

class CardAvatarAccount extends StatefulWidget {
  const CardAvatarAccount({
    Key? key,
    required this.childText,
    required this.widgetImage,
    required this.firstName,
    required this.lastName,
    required this.onPressed,
  }) : super(key: key);

  final String childText;
  final Widget? widgetImage;
  final String firstName;
  final String lastName;
  final Function()? onPressed;

  @override
  State<CardAvatarAccount> createState() => _CardAvatarAccountState();
}

class _CardAvatarAccountState extends State<CardAvatarAccount> {
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<AccountProvider>(context, listen: true);
    // User? user = FirebaseAuth.instance.currentUser;

    // Future<XFile?> getImageProfile() async {
    //   return await ImagePicker().pickImage(source: ImageSource.gallery);
    // }

    // Future<String> uploadImageProfile(XFile imageProfile) async {
    //   String filename = basename(imageProfile.path);
    //   Reference ref = FirebaseStorage.instance.ref().child(filename);
    //   UploadTask task = ref.putFile(File(imageProfile.path));
    //   TaskSnapshot snapshot = await task;
    //   return await snapshot.ref.getDownloadURL();
    // }

    // Future<String> changeImageProfile() async {
    //   XFile? xFile = await getImageProfile();
    //   String imageProfilePath = await uploadImageProfile(xFile!);
    //   setState(() {});
    //   return imageProfilePath;
    // }

    return Card(
      elevation: 0.0,
      color: Color(0xFFECF0F1),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 2.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 29,
                  child: ClipOval(
                    child: widget.widgetImage,
                    // snapshot.data['profile-picture'] == ""
                    //     ? Image.asset("assets/icons/ic_user_scam.png")
                    //     : CachedNetworkImage(
                    //         imageUrl: snapshot.data['profile-picture'],
                    //         width: MediaQuery.of(context).size.width,
                    //         height: MediaQuery.of(context).size.height,
                    //         fit: BoxFit.cover,
                    //       ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                      text: widget.firstName + ' ',
                      // snapshot.data['firstname'] + ' ',
                      style: GoogleFonts.montserrat(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: widget.lastName,
                          // snapshot.data['lastname'],
                          style: GoogleFonts.montserrat(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F2E41),
                          ),
                        ),
                      ],
                    )),
                    TextButton(
                      onPressed: widget.onPressed,
                      // () async {
                      //   FirebaseFirestore.instance
                      //       .collection('users')
                      //       .doc(provider.user?.uid)
                      //       .update({
                      //     'profile-picture':
                      //         await provider.changeImageProfile()
                      //   });
                      // },
                      child: Text(
                        widget.childText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          color: Color(0xFF428DFF),
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(1.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
