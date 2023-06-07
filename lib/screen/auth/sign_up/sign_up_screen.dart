import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/const.dart';
import 'package:todo_app/screen/auth/sign_up/provider/sign_up_provider.dart';
import 'package:todo_app/screen/auth/sign_up/widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0)
                .copyWith(top: size.height * 0.03),
            child: Consumer<SignUpProvider>(
              builder: (_, auth, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      child: Image.asset(
                        'assets/icons/Logo.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.12),
                  buildSignUpTopSection(),
                  const SizedBox(height: 38),
                  buildSignUpTextFormField(
                      controller: auth.userNameController,
                      hintText: "Username",
                      color: AppConst.lightYellow),
                  const SizedBox(height: 14),
                  buildSignUpTextFormField(
                      controller: auth.emailController,
                      hintText: "Email",
                      email: false,
                      color: AppConst.lightWhite),
                  const SizedBox(height: 14),
                  buildSignUpTextFormField(
                      controller: auth.passwordController,
                      hintText: "Password",
                      obsecure: true,
                      color: AppConst.lightWhite),
                  const SizedBox(height: 30),
                  buildCustomButton(
                      func: () async {
                        await auth
                            .createEmailAndPassword();
                        auth.userNameController.clear();
                        auth.emailController.clear();
                        auth.passwordController.clear();

                      },
                      text: 'SignUp'),
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      auth.userNameController.clear();
                      auth.emailController.clear();
                      auth.passwordController.clear();
                    },
                    child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Go back!',
                          style: TextStyle(color: Colors.grey),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
