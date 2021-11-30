import 'package:flutter/material.dart';
import 'package:susmatior_app/ui/screens/detail_list/detail_list_screens.dart';
import 'package:susmatior_app/ui/screens/home/widgets/card_list_scam.dart';
import 'package:susmatior_app/ui/screens/questionnaire/questionnaire_screens.dart';

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
              margin: const EdgeInsets.all(0),
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
                    hintStyle: const TextStyle(color: Colors.white),
                    hintMaxLines: 1,
                    suffixIcon: const Icon(
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
              // Change this listview to listview.builder if using firebase
              child: ListView(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, DetailListScreen.routeName),
                    child: CardListScam(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE8EDFC),
        onPressed: () {
          Navigator.pushNamed(context, QuestionnaireScreen.routeName);
        },
        child: const Icon(
          Icons.add,
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
