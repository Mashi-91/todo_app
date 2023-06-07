import 'package:flutter/material.dart';
import 'package:todo_app/screen/profile/profile_screen.dart';

import '../home_screen.dart';

class HomeProvider extends ChangeNotifier{
  int index = 0;

  currentIndex(i){
    index = i++;
    notifyListeners();
  }

  List<Widget> pages = [
    HomeScreen(),
    ProfileScreen()
  ];

  void addTask(){

  }
}