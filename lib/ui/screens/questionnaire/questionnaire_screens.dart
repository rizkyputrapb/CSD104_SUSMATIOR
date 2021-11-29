import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/gridview_evidence_widget.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/textfield_expanded_questionnaire_widget.dart';
import 'package:susmatior_app/ui/screens/questionnaire/widgets/textfield_questionnaire_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/btn_expanded_widget.dart';

class QuestionnaireScreen extends StatefulWidget {
  static const routeName = '/questionnaire_screen';
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  String _radioSelected = 'radioSeleted';
  @override
  Widget build(BuildContext context) {
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
                      ),
                      SizedBox(
                        height: padding_16,
                      ),
                      TextFormFieldExpandedBlue(
                        label: 'Descriptions',
                        isObscure: false,
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
                      GridViewEvidence(
                        countGrid: 3,
                      ),
                      SizedBox(
                        height: padding_16,
                      ),
                      InkWell(
                        onTap: () {},
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
