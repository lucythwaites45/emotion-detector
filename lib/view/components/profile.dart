import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/homepage_logo.png', // Replace with your local image path
          height: 60,
        ),
      ),
      bottomNavigationBar: NavigationBar(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              profileDetails(),
              Text("Your Photos"),
              CardSpotlight(),
            ],
          ),
        ),
      ),
    );
  }
}

class profileDetails extends StatelessWidget {
  const profileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adding padding for spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Image on the left side
              Image.asset(
                'images/profile.png', // Replace with your local image path
                height: 100,
              ),

              // Text content on the right side
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('About you', style: TextStyle(fontWeight: FontWeight.w400)),
                  Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('John Doe', style: TextStyle(fontWeight: FontWeight.w400)),
                  Text('User Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('johndoe123', style: TextStyle(fontWeight: FontWeight.w400))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CardSpotlight extends StatelessWidget {
  const CardSpotlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text('dd/mm/yy'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16), // Space between cards
          Card(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text('dd/mm/yy'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
