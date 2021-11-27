import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardListScam extends StatelessWidget {
  const CardListScam({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Color(0xFFECF0F1),
      margin: EdgeInsets.symmetric(
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
                      'assets/icons/ic_user_scam.png',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'This is text title',
                      style: GoogleFonts.montserrat(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F2E41),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'This number is a fraud, ignore this number if you This number is a fraud, ignore this number if you This number is a fraud, ignore this number if you',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: Color(0xFFAAAAAA),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Not Scam',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    color: Color(0xFF428DFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
