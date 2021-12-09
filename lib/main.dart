import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:susmatior_app/ui/screens/detail_list/detail_list_screens.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';
import 'package:susmatior_app/ui/screens/landing/landing_screen.dart';
import 'package:susmatior_app/ui/screens/login/login_screens.dart';
import 'package:susmatior_app/ui/screens/main/main_screens.dart';
import 'package:susmatior_app/ui/screens/questionnaire/questionnaire_screens.dart';
import 'package:susmatior_app/ui/screens/register/register_screens.dart';
import 'package:susmatior_app/ui/screens/setting/setting_screens.dart';
import 'package:susmatior_app/ui/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
        QuestionnaireScreen.routeName: (context) => const QuestionnaireScreen(),
        DetailListScreen.routeName: (context) => DetailListScreen(
              docId: ModalRoute.of(context)?.settings.arguments as String?,
            ),
      },
    );
  }
}
