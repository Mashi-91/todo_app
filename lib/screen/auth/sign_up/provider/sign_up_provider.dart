import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/common/toastmsg.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;

  Future createEmailAndPassword() async {
    final email = emailController.text.trim();
    final username = userNameController.text.trim();
    final password = passwordController.text;

    try {

      if(username.isEmpty){
        return toastInfo(msg: "Please enter your username");
      }
      else if (email.isEmpty) {
        return toastInfo(msg: "Please enter your email");
      } else if (password.isEmpty) {
        return toastInfo(msg: "Please enter your password");
      } else if (password.length < 7) {
        return toastInfo(msg: "Password must be greater than 7");
      }

      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password).then((value) {
              value.user!.updateDisplayName(username);
          if(value.user?.uid != null){
            return toastInfo(msg: "Thanks for joining us.");
          }});
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          toastInfo(
              msg:
              "This email is already exist, Go ahead and login!");
        }
        if (e.code == "invalid-email") {
          return toastInfo(msg: "Enter valid email");
        }
        if (e.code == "week-password") {
          return toastInfo(msg: "Password should be greater then 7.");
        }
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
