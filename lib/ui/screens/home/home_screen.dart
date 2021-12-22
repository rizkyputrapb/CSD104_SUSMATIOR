import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:susmatior_app/constants/colors_constants.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/provider/home_provider.dart';
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
              margin: EdgeInsets.zero,
              elevation: 0,
              color: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.all(padding_12),
                child: Row(
                  children: [
                    Flexible(
                      child: Consumer<HomeProvider>(
                        builder: (context, provider, _) {
                          return TextFormField(
                            controller: provider.searchKeyword,
                            cursorColor: Colors.white,
                            maxLines: 1,
                            keyboardType: TextInputType.phone,
                            style: GoogleFonts.montserrat(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: primaryColor,
                              filled: true,
                              hintText: 'Search...',
                              hintStyle:
                                  GoogleFonts.montserrat(color: Colors.white),
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
                            onFieldSubmitted: (value) {
                              provider.searchScams(value);
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
                        margin: EdgeInsets.zero,
                        color: selagoColor,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              QuestionnaireScreen.routeName,
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, provider, _) {
                return Expanded(
                  child: StreamBuilder<QuerySnapshot<dynamic>>(
                    stream: (provider.searchKeyword.text != "" &&
                            provider.searchKeyword.text.isNotEmpty)
                        ? provider.dataScam
                            .where('search-key',
                                arrayContains: provider.searchKeyword.text)
                            .snapshots()
                        : provider.dataScam.limit(10).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        return AnimationLimiter(
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (_, index) {
                                DocumentSnapshot data =
                                    snapshot.data!.docs[index];
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Column(
                                        children: [
                                          CardListScam(
                                            title: data['pnumber'],
                                            description: data['description'],
                                            status: data['status'],
                                            onTap: () {
                                              if (kDebugMode) {
                                                print("id = ${data.id}");
                                              }
                                              Navigator.pushNamed(context,
                                                  DetailListScreen.routeName,
                                                  arguments: data.id);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Column(
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
