import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class GeneralPage extends StatelessWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/login_image.png', // Replace with your local image path
              height: 150, // Adjust the height as needed
            ),
            const TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
            Expanded(
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
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

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
                  Navigator.pushNamed(context, '/home');
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

class SignupCard extends StatelessWidget {
  const SignupCard({Key? key}) : super(key: key);

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
                  Navigator.pushNamed(context, '/home');
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
