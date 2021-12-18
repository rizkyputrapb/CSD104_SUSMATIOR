import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';

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
      color: porcelainColor,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 2.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding_8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(padding_8),
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
                padding: const EdgeInsets.all(padding_8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: firstName + ' ',
                        style: GoogleFonts.montserrat(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                          color: charadeColor,
                        ),
                        children: [
                          TextSpan(
                            text: lastName,
                            style: GoogleFonts.montserrat(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                              color: charadeColor,
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
                          color: primaryColor,
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
