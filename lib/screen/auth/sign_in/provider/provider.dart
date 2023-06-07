import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/common/toastmsg.dart';

import '../../../home/home_controller.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;
  final firebaseAuth = FirebaseAuth.instance;

  obsecureToggle() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  Future loginWithEmailAndPassword(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      if (email.isEmpty) {
        return toastInfo(msg: "Please enter your email");
      } else if (password.isEmpty) {
        return toastInfo(msg: "Please enter your password");
      } else if (password.length < 7) {
        return toastInfo(msg: "Password must be greater than 7");
      }

      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password).then((value) {
        if(value.user != null){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => HomeController(),), (
              route) => false);
        }});
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          toastInfo(
              msg:
                  "There's no account with this email, Please create a new account!");
        }
        if (e.code == "invalid-email") {
          return toastInfo(msg: "Enter valid email");
        }
        if (e.code == "wrong-password") {
          return toastInfo(msg: "Enter valid password");
        }
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
