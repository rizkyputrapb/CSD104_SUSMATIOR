import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class QuestionnaireProvider extends ChangeNotifier {
  String _radioSelected = '';
  Future<XFile?>? imageFile;
  List<Object> images = <Object>[];

  String get radioSelected => _radioSelected;

  void selectedRadio(String selected) {
    _radioSelected = selected;
    notifyListeners();
    print("Selected radiobutton: $_radioSelected");
  }

  Future<XFile?> imgFromGallery() async {
    imageFile = ImagePicker().pickImage(source: ImageSource.gallery);
    notifyListeners();
    return await imageFile;
  }

  Future<String> uploadImage(XFile imageFile) async {
    String filename = basename(imageFile.path);
    return filename;
  }

  Future<String> uploadImages(String path) async {
    XFile? imagePath = await imageFile;
    String filename = basename(imagePath!.path);
    Future<String> img = uploadImage(XFile(filename.toString()));
    Reference ref = FirebaseStorage.instance.ref().child(await img);
    UploadTask task = ref.putFile(File(imagePath.path));
    TaskSnapshot snapshot = await task;
    String url = await snapshot.ref.getDownloadURL();
    print(url);
    return url;
  }
}
