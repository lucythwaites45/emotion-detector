import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class displaySettingSheet extends StatefulWidget {
  const displaySettingSheet({super.key});

  @override
  State<displaySettingSheet> createState() => _displaySettingSheetState();
}

class _displaySettingSheetState extends State<displaySettingSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi',
        ),
      ),

    );
  }
}
