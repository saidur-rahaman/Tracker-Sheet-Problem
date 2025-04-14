import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Create a basic Flutter application that displays "Hello World!" in
// the center of the screen with a custom font and color.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World App'),
        ),
        body: Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontFamily: GoogleFonts.monoton().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
