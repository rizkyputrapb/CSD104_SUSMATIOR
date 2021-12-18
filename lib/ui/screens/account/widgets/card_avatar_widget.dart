import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAvatarAccount extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 29,
                  child: ClipOval(
                    child: widgetImage,
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
                        text: firstName + ' ',
                        style: GoogleFonts.montserrat(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2F2E41),
                        ),
                        children: [
                          TextSpan(
                            text: lastName,
                            style: GoogleFonts.montserrat(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2F2E41),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: Text(
                        childText,
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
