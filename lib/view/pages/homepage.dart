import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/floating_camera_button.dart';
import '../components/general.dart';
import '../components/bottomSheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(125, 100, 120, 10),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showCupertinoModalBottomSheet(
                isDismissible: false,
                enableDrag: true,
                barrierColor: Colors.transparent,
                expand: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(100.0)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return CustomizedBottomSheet();
                }
              );
            },
            child: const Text(
              "open me",
            )
        ),
      ),
    );
  }
}



