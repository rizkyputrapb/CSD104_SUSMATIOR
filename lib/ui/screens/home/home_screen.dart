import 'package:flutter/material.dart';
import 'package:susmatior_app/constants/radius_constants.dart';
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
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.23,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 47,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF428DFF),
                        borderRadius: BorderRadius.circular(radius_30),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            QuestionnaireScreen.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
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
    );
  }
}
