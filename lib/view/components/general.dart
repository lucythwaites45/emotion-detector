import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/pages/accounts_page.dart';
import 'package:general_waste_classifier/view/pages/charts.dart';
import 'package:general_waste_classifier/view/components/floating_camera_button.dart';
import 'package:general_waste_classifier/view/pages/homepage.dart';
import '../pages/charts.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar),
            label: "charts",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera),
            label: "camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: "account",
            backgroundColor: Colors.black,
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const Charts();
        } else if (index == 1) {
          return const HomePage();
        } else {
          return const AccountPage();
        }
        // switch (index) {
        //   case 0:
        //     return CupertinoTabView(
        //       builder: (context) {
        //         return const Charts();
        //       },
        //     );
        //   case 1:
        //     return CupertinoTabView(
        //       builder: (context) {
        //         return const HomePage();
        //       },6
        //     );
        //   case 2:
        //     return CupertinoTabView(
        //       builder: (context) {
        //         return const AccountPage();
        //       },
        //     );
        //   default:
        //     return null;
        // }
      },
    );
  }
}
