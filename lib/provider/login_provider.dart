import 'package:flutter/material.dart';
import 'package:susmatior_app/constants/authstatus_enum.dart';
import 'package:susmatior_app/util/firebase_auth_helper.dart';

class LoginProvider extends ChangeNotifier {
  AuthResultStatus? _state;

  AuthResultStatus? get state => _state;

  void firebaseLogin(
      String email, String password, BuildContext context) async {
    _state = AuthResultStatus.loading;
    notifyListeners();
    await FirebaseAuthHelper().login(email: email, pass: password).then(
      (status) {
        switch (status) {
          case AuthResultStatus.successful:
            _state = AuthResultStatus.successful;
            notifyListeners();
            break;
          case AuthResultStatus.wrongPassword:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Wrong Password"),
              ),
            );
            _state = AuthResultStatus.wrongPassword;
            notifyListeners();
            break;
          case AuthResultStatus.userNotFound:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("User Not Found"),
              ),
            );
            _state = AuthResultStatus.userNotFound;
            notifyListeners();
            break;
        }
      },
    );
  }
}
