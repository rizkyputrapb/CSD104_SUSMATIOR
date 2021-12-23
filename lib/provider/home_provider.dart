import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {
  final dataScam = FirebaseFirestore.instance.collection('data-scams');
  TextEditingController searchKeyword = TextEditingController();
  String searchScams(String value) {
    searchKeyword.text = value;
    searchKeyword.selection = TextSelection.fromPosition(
      TextPosition(
        offset: searchKeyword.text.length,
      ),
    );
    notifyListeners();
    return value;
  }
}
