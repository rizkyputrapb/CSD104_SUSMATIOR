import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:susmatior_app/provider/preferences_provider.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting_screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(
        textTitle: 'Settings',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Notifications',
              style: GoogleFonts.montserrat(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Enable daily Notifications as reminder of check informations",
                    style: GoogleFonts.montserrat(fontSize: 16.0),
                  ),
                ),
                Consumer<PreferencesProvider>(
                  builder: (context, provider, _) {
                    return Flexible(
                      flex: 1,
                      child: Switch.adaptive(
                        value: provider.isDailyReminderActive,
                        activeColor: const Color(0xFF428DFF),
                        onChanged: (newValue) {
                          provider.setDailyReminderActive(newValue);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
