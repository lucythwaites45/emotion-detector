import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/pages/accounts_page.dart';
import 'package:general_waste_classifier/view/pages/recommendation.dart';
import 'package:general_waste_classifier/view/components/general.dart';
import 'view/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        backgroundColor: Colors.white,
      ),
      home: const GeneralPage(),
      // routes: {
      //   '/homepage': (context) => const HomePage(),
      //   '/chartspage': (context) => const Charts(),
      //   '/accountpage': (context) => const AccountPage(),
      // },
    );
  }
}



