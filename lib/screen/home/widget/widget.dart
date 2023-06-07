import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../common/const.dart';

Widget customBottomNavigationBar({
  required void Function(int) onTap,
  required int currentIndex,
  required Function addTap,
}) {
  return Container(
    height: 70,
    margin: const EdgeInsets.symmetric(horizontal: 26).copyWith(bottom: 8),
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(28)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: BottomNavigationBar(
              iconSize: 26,
              currentIndex: currentIndex,
              onTap: (val) => onTap(val),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppConst.lightGreenAccent,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FluentIcons.home_12_regular),
                  label: '',
                  activeIcon: Icon(FluentIcons.home_12_filled),
                ),
                BottomNavigationBarItem(
                    icon: Icon(FluentIcons.person_20_regular),
                    label: '',
                    activeIcon: Icon(FluentIcons.person_20_filled)),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            child: GestureDetector(
              onTap: () => addTap(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConst.lightGreenAccent,
                ),
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget customContainer1({
  required double width,
  required double height,
  required String title,
  required String task,
}) {
  return Container(
    width: width,
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10)
        .copyWith(left: 16),
    decoration: BoxDecoration(
      color: AppConst.lightGreenAccent,
      borderRadius: BorderRadius.circular(16).copyWith(
        topLeft: const Radius.circular(30),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              "assets/icons/priority1-icon.svg",
              width: 90,
              height: 90,
            )),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          task,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        )
      ],
    ),
  );
}

Widget customContainer2({
  required String imgPath,
  required Color color,
  required String title,
  required String task,
}) {
  return Container(
    width: 170,
    height: 90,
    padding: const EdgeInsets.symmetric(vertical: 16).copyWith(left: 12),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16).copyWith(
        topLeft: const Radius.circular(30),
      ),
    ),
    child: Row(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              "assets/icons/$imgPath",
              width: 52,
              height: 52,
            )),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 50,
              child: Text(
                task,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade700,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget customListCard({
  required String imgPath,
  required String title,
  required String subTitle,
  required Function func,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14), color: AppConst.lightGrey),
    child: Row(
      children: [
        SvgPicture.asset(
          "assets/icons/$imgPath",
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subTitle,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                SizedBox(
                  width: 46,
                  child: Stack(
                    children: const [
                      CircleAvatar(
                        radius: 12,
                        child: Icon(
                          FluentIcons.person_20_regular,
                          size: 12,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 12,
                          child: Icon(
                            FluentIcons.person_20_regular,
                            size: 12,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 12,
                          child: Icon(
                            FluentIcons.person_20_regular,
                            size: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                LinearPercentIndicator(
                  padding: const EdgeInsets.only(left: 0, right: 8),
                  width: 150.0,
                  lineHeight: 6.0,
                  percent: 0.5,
                  barRadius: const Radius.circular(16),
                  backgroundColor: AppConst.black,
                  progressColor: AppConst.lightBlueAccent,
                  trailing: const Text(
                    '50%',
                    style: TextStyle(
                      color: AppConst.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
            onTap: () =>func(),
            child: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ))
      ],
    ),
  );
}
