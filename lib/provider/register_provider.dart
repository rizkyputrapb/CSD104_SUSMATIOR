import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:susmatior_app/constants/authstatus_enum.dart';
import 'package:susmatior_app/util/firebase_auth_helper.dart';

class RegisterProvider extends ChangeNotifier {
  AuthResultStatus? _state;

  AuthResultStatus? get state => _state;

  void register(String email, String password, String firstName,
      String lastName, BuildContext context) async {
    _state = AuthResultStatus.loading;
    notifyListeners();
    await FirebaseAuthHelper().createAccount(email: email, pass: password).then(
      (status) async {
        User? user = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .set({
          'uid': user.uid,
          'email': email,
          'password': password.hashCode,
          'firstname': firstName,
          'lastname': lastName,
          'profile-picture': "",
        });
        switch (status) {
          case AuthResultStatus.successful:
            _state = AuthResultStatus.successful;
            notifyListeners();
            break;
          case AuthResultStatus.emailAlreadyExists:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email already registered!"),
              ),
            );
            _state = AuthResultStatus.emailAlreadyExists;
            notifyListeners();
            break;
          case AuthResultStatus.invalidEmail:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please insert a valid email address!"),
              ),
            );
            _state = AuthResultStatus.invalidEmail;
            notifyListeners();
            break;
          case AuthResultStatus.operationNotAllowed:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Operations not allowed!"),
              ),
            );
            _state = AuthResultStatus.operationNotAllowed;
            notifyListeners();
            break;
          case AuthResultStatus.undefined:
            // ignore: todo
            // TODO: Handle this case.
            break;
          case AuthResultStatus.loading:
            // ignore: todo
            // TODO: Handle this case.
            break;
          case AuthResultStatus.wrongPassword:
            // ignore: todo
            // TODO: Handle this case.
            break;
          case AuthResultStatus.userNotFound:
            // ignore: todo
            // TODO: Handle this case.
            break;
          case AuthResultStatus.error:
            // ignore: todo
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
}
