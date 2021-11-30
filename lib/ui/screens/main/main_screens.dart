import 'package:flutter/material.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';
import 'package:susmatior_app/ui/screens/setting/setting_screens.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavbarIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _bottomNavbarIndex = index;
    });
  }

  final List<Widget> _listWidget = <Widget>[
    const HomeScreen(),
    const Placeholder(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavbarIndex],
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF428DFF),
        child: SalomonBottomBar(
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text('Profile'),
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.settings,
              ),
              title: Text('Settings'),
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
