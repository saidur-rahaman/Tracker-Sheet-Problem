import 'package:flutter/material.dart';

// Create an app that displays a list of items using a ListView.
// Each item should be a text widget with a unique number.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item List',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Item List'),
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return MyList(item: 'Item ${index + 1}');
            },
          )),
    );
  }
}

class MyList extends StatelessWidget {
  final String item;

  @override
  const MyList({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lightBlue[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 100.0,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
