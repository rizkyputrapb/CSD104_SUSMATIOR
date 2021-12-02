import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/btn_expanded_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        textTitle: 'Account',
      ),
      body: ListView(
        children: [
          Card(
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
                            'assets/icons/ic_user_scam.png',
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
                            'John Doe',
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
                            'Change Photo Profile',
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
          ),
          Card(
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
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
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
                            'abcdef@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              color: Color(0xFF2F2E41),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: ButtonRectangleExpanded(textButton: 'Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
