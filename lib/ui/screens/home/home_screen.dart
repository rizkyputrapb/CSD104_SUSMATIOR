import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:susmatior_app/ui/screens/detail_list/detail_list_screens.dart';
import 'package:susmatior_app/ui/screens/home/widgets/card_list_scam.dart';
import 'package:susmatior_app/ui/screens/questionnaire/questionnaire_screens.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataScam = firestore.collection('data-scams');

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
                    Flexible(
                      child: TextFormField(
                        controller: searchKeyword,
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
                        onChanged: (value) {
                          setState(
                            () {
                              searchKeyword.text = value;
                              searchKeyword.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                  offset: searchKeyword.text.length,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 47,
                    ),
                    ClipOval(
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Color(0xFFE8EDFC),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              QuestionnaireScreen.routeName,
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xFF428DFF),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              // Change this listview to listview.builder if using firebase
              child: StreamBuilder<QuerySnapshot<dynamic>>(
                stream: (searchKeyword.text != "" &&
                        searchKeyword.text.isNotEmpty)
                    ? dataScam
                        .where('search-key', arrayContains: searchKeyword.text)
                        .snapshots()
                    : dataScam.limit(10).snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return Column(
                            children: [
                              CardListScam(
                                title: data['pnumber'],
                                description: data['description'],
                                status: data['status'],
                                onTap: () {
                                  print("id = ${data.id}");
                                  Navigator.pushNamed(
                                      context, DetailListScreen.routeName,
                                      arguments: data.id);
                                },
                              ),
                            ],
                          );
                        });
                  } else {
                    return Column(
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
