import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';
import 'package:susmatior_app/provider/questionnaire_provider.dart';
import 'package:susmatior_app/ui/screens/main/main_screens.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/textfield_expanded_questionnaire_widget.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/textfield_questionnaire_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';

class QuestionnaireScreen extends StatefulWidget {
  static const routeName = '/questionnaire_screen';

  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  late CollectionReference dataScam;
  late FirebaseFirestore firestore;
  late QuestionnaireProvider provider;

  @override
  void initState() {
    firestore = FirebaseFirestore.instance;
    dataScam = firestore.collection('data-scams');
    super.initState();
  }

  Widget showImage() {
    return FutureBuilder<XFile?>(
      future: provider.imageFile,
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
                    child: const Icon(
                      Icons.change_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      XFile? file = await provider.imgFromGallery();
                      await provider.uploadImage(file!);
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
              XFile? file = await provider.imgFromGallery();
              await provider.uploadImage(file!);
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

  @override
  void deactivate() {
    provider.clear();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<QuestionnaireProvider>(context, listen: true);
    return Scaffold(
      appBar: const AppBarPrimary(
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
                          keyboardType: TextInputType.number,
                          isObscure: false,
                          controller: phoneNumberController,
                          validator: (text) {
                            if (text!.isNotEmpty || text != "") {
                              if (text.length > 9 && text.length < 15) {
                                provider.validatePNumber(true);
                                return null;
                              } else {
                                provider.validatePNumber(false);
                                return "Please input a valid phone number";
                              }
                            } else {
                              provider.validatePNumber(false);
                              return "This form should not be empty";
                            }
                          }),
                      const SizedBox(
                        height: padding_16,
                      ),
                      TextFormFieldExpandedBlue(
                        label: 'Descriptions',
                        isObscure: false,
                        controller: descriptionController,
                        validator: (value) {
                          if (value!.isNotEmpty || value != "") {
                            provider.validateDesc(true);
                            return null;
                          } else {
                            provider.validateDesc(false);
                            return "Please fill this field";
                          }
                        },
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
                      Consumer<QuestionnaireProvider>(
                          builder: (context, provider, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.3,
                                  child: Radio(
                                    value: 'Scam',
                                    groupValue: provider.radioSelected,
                                    onChanged: (value) {
                                      provider.selectedRadio(value as String);
                                    },
                                    activeColor: primaryColor,
                                    fillColor: MaterialStateColor.resolveWith(
                                      (states) => primaryColor,
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
                                    groupValue: provider.radioSelected,
                                    onChanged: (value) {
                                      provider.selectedRadio(value as String);
                                    },
                                    activeColor: primaryColor,
                                    fillColor: MaterialStateColor.resolveWith(
                                      (states) => primaryColor,
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
                        );
                      }),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                        ],
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      InkWell(
                        onTap: () async {
                          if (provider.isPNumberValidated == true &&
                              provider.isDescValidated == true &&
                              provider.isImageAdded == true &&
                              provider.isScamRadioSelected == true) {
                            if (kDebugMode) {
                              print("all form filled!");
                            }
                            provider.loadingState(true);
                            try {
                              String imagePath = await provider
                                  .uploadImages(provider.imageFile.toString());

                              await dataScam.add({
                                'pnumber': phoneNumberController.text,
                                'description': descriptionController.text,
                                'status': provider.radioSelected,
                                'image': imagePath,
                                'search-key':
                                    setSearchKey(phoneNumberController.text),
                              }).whenComplete(() {
                                provider.loadingState(false);
                                Navigator.pushNamedAndRemoveUntil(context,
                                    MainScreen.routeName, (route) => false);
                              });
                            } catch (e) {
                              if (kDebugMode) {
                                print("error: $e");
                              }
                            }
                          } else {
                            Fluttertoast.showToast(
                              msg: "Please fill all of the forms!",
                              backgroundColor: Colors.grey.withOpacity(0.75),
                              textColor: Colors.white,
                            );
                          }
                        },
                        child: Ink(
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(padding_16),
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(radius_8),
                              right: Radius.circular(radius_8),
                            ),
                          ),
                          child: Center(
                            child: provider.isLoading == true
                                ? const CircularProgressIndicator(
                                    color: blueTertiary,
                                  )
                                : Text(
                                    "Submit Report",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                          ),
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
