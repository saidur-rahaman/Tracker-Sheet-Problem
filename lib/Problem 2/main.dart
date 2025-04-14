import 'package:flutter/material.dart';

// Create a Flutter app with a button that,
// when pressed, changes the text on the
// screen to "Button Pressed". Use a StatefulWidget for this.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Press',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Press Example'),
        ),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String button = 'Before Button Pressed';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(button),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: onButtonPressed,
          child: Text(
            'Press Me',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent),
          ),
        ),
      ],
    );
  }

  void onButtonPressed() {
    setState(() {
      button = 'Button Pressed';
    });
  }
}
