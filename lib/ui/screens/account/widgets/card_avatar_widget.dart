import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CardAvatarAccount extends StatefulWidget {
  CardAvatarAccount({
    Key? key,
    required this.childText,
  }) : super(key: key);

  String childText;

  @override
  State<CardAvatarAccount> createState() => _CardAvatarAccountState();
}

class _CardAvatarAccountState extends State<CardAvatarAccount> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    Future<XFile?> getImageProfile() async {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    Future<String> uploadImageProfile(XFile imageProfile) async {
      String filename = basename(imageProfile.path);
      Reference ref = FirebaseStorage.instance.ref().child(filename);
      UploadTask task = ref.putFile(File(imageProfile.path));
      TaskSnapshot snapshot = await task;
      return await snapshot.ref.getDownloadURL();
    }

    Future<String> changeImageProfile() async {
      XFile? xFile = await getImageProfile();
      String imageProfilePath = await uploadImageProfile(xFile!);
      setState(() {});
      return imageProfilePath;
    }

    return FutureBuilder<dynamic>(
      future:
          FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
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
                          child: snapshot.data['profile-picture'] == ""
                              ? Image.asset("assets/icons/ic_user_scam.png")
                              : Image.network(
                                  snapshot.data['profile-picture'],
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  fit: BoxFit.cover,
                                ),
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
                            text: snapshot.data['firstname'] + ' ',
                            style: GoogleFonts.montserrat(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2F2E41),
                            ),
                            children: [
                              TextSpan(
                                text: snapshot.data['lastname'],
                                style: GoogleFonts.montserrat(
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2F2E41),
                                ),
                              ),
                            ],
                          )),
                          TextButton(
                            onPressed: () async {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user.uid)
                                  .update({
                                'profile-picture': await changeImageProfile()
                              });
                            },
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
        } else if (snapshot.hasError) {
          return Text('Unknown');
        } else {
          return Column(
            children: [
              CircularProgressIndicator(),
            ],
          );
        }
      },
    );
  }
}
