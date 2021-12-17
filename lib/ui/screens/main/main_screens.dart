import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
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
        color: const Color(0xFF428DFF),
        child: SalomonBottomBar(
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Profile'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
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
