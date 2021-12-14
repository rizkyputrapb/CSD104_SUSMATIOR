import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AccountProvider extends ChangeNotifier {
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
    notifyListeners();
    return imageProfilePath;
  }
}
