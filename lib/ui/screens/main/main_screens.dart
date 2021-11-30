import 'package:flutter/material.dart';
import 'package:susmatior_app/ui/screens/home/home_screen.dart';
import 'package:susmatior_app/ui/screens/questionnaire/questionnaire_screens.dart';
import 'package:susmatior_app/ui/screens/setting/setting_screens.dart';

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
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavbarIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE8EDFC),
        onPressed: () {
          Navigator.pushNamed(context, MainScreen.routeName);
        },
        child: const Icon(
          Icons.home,
          color: Color(0xFF7FACFA),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 7,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF428DFF),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedItemColor: const Color(0xFFBBE1FA),
          unselectedItemColor: Colors.white,
          currentIndex: _bottomNavbarIndex,
          onTap: _onItemTap,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
