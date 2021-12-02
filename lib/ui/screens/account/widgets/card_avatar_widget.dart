import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAvatarAccount extends StatelessWidget {
  CardAvatarAccount({
    Key? key,
    required this.imageUserAccount,
    required this.titleText,
    required this.childText,
  }) : super(key: key);

  String imageUserAccount;
  String titleText;
  String childText;

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
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 27,
                  child: ClipOval(
                    child: Image.asset(
                      imageUserAccount,
                    ),
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
                    Text(
                      titleText,
                      style: GoogleFonts.montserrat(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F2E41),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      childText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: Color(0xFF428DFF),
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