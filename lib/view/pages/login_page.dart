import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              const Icon(
                CupertinoIcons.airplane,
                color: Colors.blue,
                size: 150,
              ),
              const SizedBox(height: 20.0,),
              //App name:
              const Text(
                "Emotion",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Detector",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0,),
              const LogInTextField(hintText: "Email Address",),
              const SizedBox(height: 7.0,),
              const LogInTextField(hintText: "Password",),
              const SizedBox(height: 10.0,),
              const Text("--------------------OR--------------------"),
              const SizedBox(height: 10.0,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SignInButton(
                  text: "Sign in with Apple",
                  bgColor: Colors.black,
                  imagePath: 'images/apple_logo.jpeg',
                  imageWidth: 50.0,
                  imageHeight: 50.0,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 9.0,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SignInButton(
                  text: "Sign in with Google",
                  bgColor: Colors.blue,
                  imagePath: 'images/apple_logo.jpeg',
                  imageWidth: 50,
                  imageHeight: 50,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogInTextField extends StatefulWidget {
  final String hintText;
  const LogInTextField({super.key, required this.hintText});

  @override
  State<LogInTextField> createState() => _LogInTextFieldState();
}

class _LogInTextFieldState extends State<LogInTextField> {
  final myLogInTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myLogInTextController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myLogInTextController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    final text = myLogInTextController.text;
    print('Second text field: $text (${text.characters.length})');
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: TextField(
        controller: myLogInTextController,
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}


class SignInButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final String? imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle textStyle;
  const SignInButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 80,
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath!),
            width: imageWidth,
            height: imageHeight,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      )
      // child: Text(
      //   text,
      //   style: textStyle,
      // ),
    );
  }
}

