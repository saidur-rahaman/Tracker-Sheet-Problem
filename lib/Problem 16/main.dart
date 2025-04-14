import 'package:flutter/material.dart';

// Design a simple app where a container changes its size, color,
//and shape when a button is clicked, using animation.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedContainerDemo(),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});
  @override
  AnimatedContainerDemoState createState() => AnimatedContainerDemoState();
}

class AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _isTransformed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _isTransformed ? 200 : 100,
              height: _isTransformed ? 200 : 100,
              decoration: BoxDecoration(
                color: _isTransformed ? Colors.blue[400] : Colors.red[400],
                borderRadius: BorderRadius.circular(_isTransformed ? 100 : 0),
              ),
              curve: Curves.easeInOut,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isTransformed = !_isTransformed;
                });
              },
              child: Text('Transform Container'),
            ),
          ],
        ),
      ),
    );
  }
}
