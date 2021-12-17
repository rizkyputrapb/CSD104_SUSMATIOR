import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susmatior_app/preferences/preference_helper.dart';
import 'package:susmatior_app/provider/account_provider.dart';
import 'package:susmatior_app/provider/login_provider.dart';
import 'package:susmatior_app/provider/preferences_provider.dart';
import 'package:susmatior_app/provider/questionnaire_provider.dart';
import 'package:susmatior_app/ui/screens/detail_list/detail_list_screens.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';
import 'package:susmatior_app/ui/screens/landing/landing_screen.dart';
import 'package:susmatior_app/ui/screens/login/login_screens.dart';
import 'package:susmatior_app/ui/screens/main/main_screens.dart';
import 'package:susmatior_app/ui/screens/questionnaire/questionnaire_screens.dart';
import 'package:susmatior_app/ui/screens/register/register_screens.dart';
import 'package:susmatior_app/ui/screens/setting/setting_screens.dart';
import 'package:susmatior_app/ui/screens/splash/splash_screen.dart';
import 'package:susmatior_app/util/background_service.dart';
import 'package:susmatior_app/util/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionnaireProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PreferencesProvider(
            preferencesHelper: PreferenceHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LandingScreen.routeName: (context) => const LandingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingScreen.routeName: (context) => const SettingScreen(),
        QuestionnaireScreen.routeName: (context) => QuestionnaireScreen(),
        DetailListScreen.routeName: (context) => DetailListScreen(
              docId: ModalRoute.of(context)?.settings.arguments as String?,
            ),
      },
    );
  }
}
