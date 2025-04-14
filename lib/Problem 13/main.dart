import 'package:flutter/material.dart';

// Create an app with a customized AppBar.
// Add a logo, title, and actions like a search button or menu icon.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/003/589/149/non_2x/mix-icon-for-demo-vector.jpg'), // Add your logo here
          ),
          title: Text('Demo App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          actions: [
            IconButton(
              icon: Icon(Icons.search,
                  color: Colors.white), // Add your search icon here
              style: IconButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Colors.red[200],
              ),
              onPressed: () {
                // Add search functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Add menu functionality here
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Home Page!'),
        ),
      ),
    );
  }
}
