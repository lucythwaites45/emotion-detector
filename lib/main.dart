import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/not_using/accounts_page.dart';
import 'package:general_waste_classifier/view/not_using/recommendation.dart';
import 'package:general_waste_classifier/view/components/general.dart';
import 'package:general_waste_classifier/view/components/home.dart';
import 'package:general_waste_classifier/view/components/homepage.dart';
import 'package:general_waste_classifier/view/components/profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'emotion Detector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        backgroundColor: Colors.white,
      ),
      initialRoute: '/', // Optionally set initial route
      routes: {
        '/': (context) => const GeneralPage(),
        '/home': (context) => const Home(),
        '/homepage': (context) => const HomePage(),// Define the route for Home widget
        '/profile': (context) => const Profile(),
      },
    );
  }
}
