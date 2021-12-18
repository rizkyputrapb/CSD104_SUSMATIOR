import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/ui/screens/account/account_screens.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';
import 'package:susmatior_app/ui/screens/setting/setting_screens.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavbarIndex = 1;
  late User? currentUser;

  void _onItemTap(int index) {
    setState(() {
      _bottomNavbarIndex = index;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() {
    currentUser = FirebaseAuth.instance.currentUser;
  }

  final List<Widget> _listWidget = <Widget>[
    const AccountScreen(),
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavbarIndex],
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        child: SalomonBottomBar(
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.account_circle,
              ),
              title: Text(
                'Profile',
                style: GoogleFonts.montserrat(),
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.montserrat(),
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              title: Text(
                'Settings',
                style: GoogleFonts.montserrat(),
              ),
            ),
          ],
          selectedItemColor: const Color(0xFFBBE1FA),
          unselectedItemColor: Colors.white,
          currentIndex: _bottomNavbarIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
