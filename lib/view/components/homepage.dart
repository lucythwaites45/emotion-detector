import 'dart:ffi';
import 'dart:io';

import 'package:camera/camera.dart';
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
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      setState(() {
        this.cameras = cameras;
        this.firstCamera = cameras.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 1;
    final ThemeData theme = Theme.of(context);

    if (cameras.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

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
              children:  <Widget>[
                CardResults(),
                SizedBox(height: 16), // Add space between the cards
                CardMoreInfo(camera: firstCamera),
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
  final CameraDescription camera;
  const CardMoreInfo({Key? key, required this.camera}) : super(key: key);

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
                  Navigator.pushNamed(context, '/take_picture');
                },
                child: const Text('Take a Picture'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!context.mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}



class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

