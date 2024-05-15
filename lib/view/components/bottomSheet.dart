import 'package:flutter/material.dart';
import '../pages/login_page.dart';

class CustomizedBottomSheet extends StatefulWidget {
  const CustomizedBottomSheet({super.key});

  @override
  State<CustomizedBottomSheet> createState() => _CustomizedBottomSheetState();
}

class _CustomizedBottomSheetState extends State<CustomizedBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "close me",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogInPage()),
                  );
                },
                child: Text(
                  "Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
