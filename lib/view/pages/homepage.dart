import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/floating_camera_button.dart';
import '../components/general.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            "hello, world",
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
            decoration: null,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     const HomePage();
      //   },
      //   child: const Icon(Icons.camera),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
    );
  }
}