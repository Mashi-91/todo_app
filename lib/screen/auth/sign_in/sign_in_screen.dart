import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/const.dart';
import 'package:todo_app/screen/auth/sign_in/provider/provider.dart';
import 'package:todo_app/screen/auth/sign_in/widget.dart';
import 'package:todo_app/screen/auth/sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final prov = Provider.of<SignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0)
                .copyWith(top: size.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: Image.asset(
                    'assets/icons/Logo.png',
                    height: 60,
                    width: 60,
                  ),
                ),
                SizedBox(height: size.height * 0.12),
                buildTopSection(func: () {
                  Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
                  }),
                const SizedBox(height: 38),
                buildTextFormField(
                  controller: prov.emailController,
                  hintText: "Email",
                  color: AppConst.lightYellow,
                  obsecure: false,
                ),
                const SizedBox(height: 14),
                buildTextFormField(
                    func: () {
                      prov.obsecureToggle();
                    },
                    controller: prov.passwordController,
                    hintText: "Password",
                    obsecure: prov.isObsecure,
                    email: false,
                    color: AppConst.lightWhite),
                buildBottomSection(
                  func: () async {
                    await prov.loginWithEmailAndPassword(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
