import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/components/homepage.dart';
import 'package:general_waste_classifier/view/components/home.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 1;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
        'images/homepage_logo.png', // Replace with your local image path
          height: 60,
        ),
    ),bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home');
                break;
              case 1:
                Navigator.pushNamed(context, '/homepage');
                break;
              case 2:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
          indicatorColor: Color(0xFFF1573F),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.photo_camera_sharp)),
              label: 'Camera',
            ),
            NavigationDestination(
              icon: Badge(
                child: Icon(Icons.account_box),
              ),
              label: 'Profile',
            ),
          ],
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'images/Media.png', // Replace with your local image path
            width: MediaQuery.of(context).size.width,


          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding here
            child: Column(
              children: const <Widget>[
                CardResults(),
                SizedBox(height: 16), // Add space between the cards
                CardMoreInfo(),
              ],
            ),
          ),



        ],
      ),
    );
  }
}

class CardResults extends StatelessWidget {
  const CardResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0), // Adding padding for spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Emotion Detected', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Anger'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Accuracy', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('67%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardMoreInfo extends StatelessWidget {
  const CardMoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text('Emotion'),
                  subtitle: const Text('Click here to see more about this'),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: const Text('See More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

