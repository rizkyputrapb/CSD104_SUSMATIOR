import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/constants/radius_constants.dart';

class CardListScam extends StatelessWidget {
  const CardListScam({
    Key? key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.status,
  }) : super(key: key);
  final String title;
  final String description;
  final String status;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: selagoColor,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius_8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius_8),
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
                    foregroundColor: Colors.transparent,
                    radius: 27,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/icons/ic_call.png',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(padding_8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                          color: charadeColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          color: silverChaliceColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(padding_8),
                  child: Text(
                    status,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.0,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
