import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/padding_constants.dart';

class QuestionnaireScreen extends StatefulWidget {
  static const routeName = '/questionnaire_screen';
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int _radioSelected = 1;
  late String _radioVal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F9F9),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xFF428DFF),
        ),
        title: Text(
          'Report Case',
          style: GoogleFonts.montserrat(
            color: Color(0xFF2F2E41),
            fontWeight: FontWeight.w400,
          ),
        ),
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
                      TextFormField(
                        style: GoogleFonts.montserrat(color: Color(0xFF2F2E41)),
                        obscureText: false,
                        cursorColor: Color(0xFF2F2E41),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle:
                              GoogleFonts.montserrat(color: Color(0xFF428DFF)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF428DFF))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF428DFF))),
                        ),
                      ),
                      SizedBox(
                        height: padding_16,
                      ),
                      TextFormField(
                        style: GoogleFonts.montserrat(color: Color(0xFF2F2E41)),
                        obscureText: false,
                        cursorColor: Color(0xFF2F2E41),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Descriptions',
                          labelStyle:
                              GoogleFonts.montserrat(color: Color(0xFF428DFF)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF428DFF))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF428DFF))),
                        ),
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
                                  value: 1,
                                  groupValue: _radioSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      value = _radioSelected;
                                      _radioVal = 'Scam';
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
                                  value: 2,
                                  groupValue: _radioSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      value = _radioSelected;
                                      _radioVal = 'Scam';
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
                              onPressed: () {},
                            ),
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
                      Container(
                        margin: EdgeInsets.only(bottom: padding_16),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(padding_16),
                          onPressed: () {},
                          color: Color(0xFF428DFF),
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8.0),
                              right: Radius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Submit Report',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18.0,
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
