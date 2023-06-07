import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/screen/home/widget/widget.dart';

import '../../common/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.darkBlue,
      appBar: AppBar(
        backgroundColor: AppConst.darkBlue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/icons/drawer_icon.svg",
              height: 16,
              width: 16,
            ),
            const Text('Task Management App'),
            const Icon(FluentIcons.person_20_regular)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                child: const Text(
                  'Every Day Your\nTask Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customContainer1(
                    height: 194,
                    width: 160,
                    title: 'First Priority',
                    task: '10 task'),
                Column(
                  children: [
                    customContainer2(
                        imgPath: 'priority2-icon.svg',
                        title: 'Second Priority',
                        task: '12 task',
                        color: AppConst.lightBlueAccent),
                    const SizedBox(height: 16),
                    customContainer2(
                        imgPath: 'priority3-icon.svg',
                        title: 'Third Priority',
                        task: '28 task',
                        color: AppConst.lightSkin),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'On Going Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 1,
            //       itemBuilder: (_, i) {
            //         return customListCard();
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
