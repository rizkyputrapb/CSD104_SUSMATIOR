import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';
import 'package:susmatior_app/ui/screens/main/main_screens.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/textfield_expanded_questionnaire_widget.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/textfield_questionnaire_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/btn_expanded_widget.dart';
import 'package:path/path.dart';

class QuestionnaireScreen extends StatefulWidget {
  static const routeName = '/questionnaire_screen';
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  String _radioSelected = '';
  Future<XFile?>? imageFile;
  List<Object> images = <Object>[];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataScam = firestore.collection('data-scams');

    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    Future<XFile?> _imgFromGallery() async {
      setState(() {
        imageFile = ImagePicker().pickImage(source: ImageSource.gallery);
      });
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

    Widget showImage() {
      return FutureBuilder<XFile?>(
        future: imageFile,
        builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
          if (snapshot.data != null) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Stack(
                children: [
                  Image.file(
                    File(
                      snapshot.data!.path,
                    ),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: InkWell(
                      child: Icon(
                        Icons.change_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        XFile? file = await _imgFromGallery();
                        await uploadImage(file!);
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.error != null) {
            return const Text(
              'Error Picking Image',
              textAlign: TextAlign.center,
            );
          } else {
            return IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                XFile? file = await _imgFromGallery();
                await uploadImage(file!);
              },
            );
          }
        },
      );
    }

    setSearchKey(String phoneNumber) {
      List<String> searchValueList = [];
      String temp = "";
      for (int i = 0; i < phoneNumber.length; i++) {
        temp = temp + phoneNumber[i];
        searchValueList.add(temp);
      }
      return searchValueList;
    }

    return Scaffold(
      appBar: AppBarPrimary(
        textTitle: 'Report Case',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: padding_16,
                    left: padding_16,
                    right: padding_16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldBlue(
                        label: 'Phone Number',
                        isObscure: false,
                        controller: phoneNumberController,
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      TextFormFieldExpandedBlue(
                        label: 'Descriptions',
                        isObscure: false,
                        controller: descriptionController,
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Status',
                        style: GoogleFonts.montserrat(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Radio(
                                  value: 'Scam',
                                  groupValue: _radioSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioSelected = value as String;
                                    });
                                  },
                                  activeColor: Color(0xFF428DFF),
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xFF428DFF),
                                  ),
                                ),
                              ),
                              Text(
                                'Scam',
                                style: GoogleFonts.montserrat(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Radio(
                                  value: 'Not Scam',
                                  groupValue: _radioSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioSelected = value as String;
                                    });
                                  },
                                  activeColor: const Color(0xFF428DFF),
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF428DFF),
                                  ),
                                ),
                              ),
                              Text(
                                'Not Scam',
                                style: GoogleFonts.montserrat(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Evidence Report',
                        style: GoogleFonts.montserrat(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: padding_12,
                      ),
                      Column(children: [
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(radius_12),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius_12),
                            ),
                            child: showImage(),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: padding_16,
                      ),
                      InkWell(
                        onTap: () async {
                          String imagePath =
                              await uploadImages(imageFile.toString());

                          dataScam.add({
                            'pnumber': phoneNumberController.text,
                            'description': descriptionController.text,
                            'status': _radioSelected,
                            'image': imagePath,
                            'search-key':
                                setSearchKey(phoneNumberController.text),
                          });

                          Navigator.pushReplacementNamed(
                              context, MainScreen.routeName);
                        },
                        child: ButtonRectangleExpanded(
                          textButton: 'Submit Report',
                        ),
                      ),
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
}
