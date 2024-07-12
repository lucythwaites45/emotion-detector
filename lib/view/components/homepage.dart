import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/not_using/accounts_page.dart';
import 'package:general_waste_classifier/view/not_using/recommendation.dart';
import 'package:general_waste_classifier/view/not_using/floating_camera_button.dart';
import 'package:general_waste_classifier/view/not_using/homepage.dart';
import '../not_using/recommendation.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Image.asset(
                'images/login_image.png', // Replace with your local image path
                height: 100, // Adjust the height as needed
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'Login'),
                  Tab(text: 'Signup'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    LoginCard(),
                    SignupCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupCard extends StatelessWidget  {
  const SignupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle signup logic here
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
