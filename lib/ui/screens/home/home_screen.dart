import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Color(0xFF428DFF),
                    filled: true,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white),
                    hintMaxLines: 1,
                    suffixIcon: Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onFieldSubmitted: (value) {},
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const [],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE8EDFC),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Color(0xFF7FACFA),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 7,
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF428DFF),
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
          selectedItemColor: Color(0xFFBBE1FA),
          unselectedItemColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
