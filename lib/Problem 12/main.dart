import 'package:flutter/material.dart';

// Design a container with a colored background, rounded corners, and a shadow.
// Inside the container, display a Text widget.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Container Example',
            style: TextStyle(
              fontSize: 24.0, // font size
              fontWeight: FontWeight.bold, // font weight
              color: Colors.white, // text color
            ),
          ),
          backgroundColor: Colors.blue, // AppBar background color
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue, // Background color
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black38, // Shadow color
                  blurRadius: 8.0, // Shadow blur
                  offset: const Offset(4, 4), // Shadow position
                ),
              ],
            ),
            child: const Text(
              'YO, Container!',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 18.0, // Font size
              ),
            ),
          ),
        ),
      ),
    );
  }
}
