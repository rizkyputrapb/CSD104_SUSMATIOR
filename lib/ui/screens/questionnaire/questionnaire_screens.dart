import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
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
  String _radioSelected = 'radioSeleted';
  // late XFile _image;
  late String imagePath;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataScam = firestore.collection('data-scams');

    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    Future<XFile?> _imgFromGallery() async {
      return await ImagePicker().pickImage(source: ImageSource.gallery);

      // setState(() {
      //   _image = image as XFile;
      // });
    }

    Future<String> uploadImage(XFile imageFile) async {
      String filename = basename(imageFile.path);
      Reference ref = FirebaseStorage.instance.ref().child(filename);
      UploadTask task = ref.putFile(File(imageFile.path));
      TaskSnapshot snapshot = await task;

      return await snapshot.ref.getDownloadURL();
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
                      SizedBox(
                        height: padding_16,
                      ),
                      TextFormFieldExpandedBlue(
                        label: 'Descriptions',
                        isObscure: false,
                        controller: descriptionController,
                      ),
                      SizedBox(
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
                                  activeColor: Color(0xFF428DFF),
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xFF428DFF),
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
                      SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Evidence Report',
                        style: GoogleFonts.montserrat(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: padding_12,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: [
                                // Image
                                Placeholder(),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () async {
                                XFile? file = await _imgFromGallery();
                                await uploadImage(file!);
                                // setState(() {});
                              },
                            ),
                            // : ClipRRect(
                            //     borderRadius: BorderRadius.circular(50),
                            //     child: Image.file(
                            //       _image as File,
                            //       width: 100,
                            //       height: 100,
                            //       fit: BoxFit.fitHeight,
                            //     ),
                            //   ),
                          ),
                          Card(
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: padding_16,
                      ),
                      InkWell(
                        onTap: () async {
                          // XFile? file = await _imgFromGallery();
                          XFile? file = await _imgFromGallery();
                          String imagePath = await uploadImage(file!);
                          dataScam.add({
                            'pnumber': phoneNumberController.text,
                            'description': descriptionController.text,
                            'status': _radioSelected,
                            'image': imagePath,
                          });
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
