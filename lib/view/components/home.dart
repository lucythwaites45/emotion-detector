import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/happy.png', // Replace with your local image path
            height: 200,
          ),
          Text("Feeling Happy"),
          Text("In the Last 7 days you were feeling mostly happy"),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding here
            child: CardSpotlight(),
          ),


        ],
      ),
    );
  }
}



class CardSpotlight extends StatelessWidget {
  const CardSpotlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures children stretch to fit horizontally
            children: <Widget>[
              Image.asset(
                'images/Media.png', // Replace with your local image path
                height: 100,
              ),
              SizedBox(height: 16), // Optional: Adds space between image and row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text('Photo Spotlight'),
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
            ],
          ),
        ),
      ),

    );
  }
}

