import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Build a list where each item can be swiped to reveal additional options like "Delete" or "Edit".

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final List<String> items = List.generate(5, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[300],
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.edit, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                final removedItem = items.removeAt(index);
                if (direction == DismissDirection.startToEnd) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$removedItem deleted')),
                  );
                } else if (direction == DismissDirection.endToStart) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Edit action triggered for $removedItem')),
                  );
                }
              });
            },
            child: ListTile(
              title: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.lobster().fontFamily,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
