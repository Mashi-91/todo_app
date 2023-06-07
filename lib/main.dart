import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/screen/addTask/provider.dart';
import 'package:todo_app/screen/auth/auth_screen.dart';
import 'package:todo_app/screen/auth/sign_in/provider/provider.dart';
import 'package:todo_app/screen/auth/sign_up/provider/sign_up_provider.dart';
import 'package:todo_app/screen/home/provider/provider.dart';

import 'common/const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpProvider(),
        ),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => addTaskProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            appBarTheme: AppBarTheme(
                backgroundColor: AppConst.darkBlue,
                iconTheme: IconThemeData(
                  color: AppConst.lightWhite,
                )),
            scaffoldBackgroundColor: AppConst.darkBlue,
            fontFamily: GoogleFonts.ubuntu().fontFamily),
        home: AuthScreen(),
      ),
    );
  }
}
