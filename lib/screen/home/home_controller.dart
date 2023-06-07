import 'dart:developer';

import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/const.dart';
import 'package:todo_app/screen/addTask/add_task_screen.dart';
import 'package:todo_app/screen/home/provider/provider.dart';
import 'package:todo_app/screen/home/widget/widget.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: AppConst.lightWhite,
      body: prov.pages[prov.index],
      extendBody: true,
      bottomNavigationBar: customBottomNavigationBar(
        onTap: (val) {
          prov.currentIndex(val);
        },
        currentIndex: prov.index,
        addTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddTaskScreen()));
        },
      ),
    );
  }
}
/**/
