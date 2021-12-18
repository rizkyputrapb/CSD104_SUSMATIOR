import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class QuestionnaireProvider extends ChangeNotifier {
  String _radioSelected = '';
  Future<XFile?>? imageFile;
  List<Object> images = <Object>[];

  bool _isPNumberValidated = false;
  bool _isDescValidated = false;
  bool _isScamRadioSelected = false;
  bool _isImageAdded = false;
  bool _isLoading = false;

  String get radioSelected => _radioSelected;
  bool get isPNumberValidated => _isPNumberValidated;
  bool get isDescValidated => _isDescValidated;
  bool get isScamRadioSelected => _isScamRadioSelected;
  bool get isImageAdded => _isImageAdded;
  bool get isLoading => _isLoading;

  void loadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  void validatePNumber(bool state) {
    _isPNumberValidated = state;
  }

  void validateDesc(bool state) {
    _isDescValidated = state;
  }

  void selectedRadio(String selected) {
    _radioSelected = selected;
    _isScamRadioSelected = true;
    if (kDebugMode) {
      print("Selected radiobutton: $_radioSelected");
    }
    notifyListeners();
  }

  void clear() {
    _isImageAdded = false;
    _isScamRadioSelected = false;
    _isPNumberValidated = false;
    _isDescValidated = false;
    _isLoading = false;
    imageFile = null;
    _radioSelected = "";
  }

  Future<XFile?> imgFromGallery() async {
    imageFile = ImagePicker().pickImage(source: ImageSource.gallery);
    _isImageAdded = true;
    notifyListeners();
    return await imageFile;
  }

  Future<String> uploadImage(XFile imageFile) async {
    String filename = basename(imageFile.path);
    notifyListeners();
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
    if (kDebugMode) {
      print("imgUrl: $url");
    }
    notifyListeners();
    return url;
  }
}
