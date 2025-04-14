import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Create an app where the user can pick a date and a time.
// Display the selected date and time on the screen.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date and Time Picker'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _selectedDate == null
                    ? 'No date selected'
                    : 'Selected Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickDate,
                child: Text('Pick a Date'),
              ),
              SizedBox(height: 20),
              Text(
                _selectedTime == null
                    ? 'No time selected'
                    : 'Selected Time: ${_selectedTime!.format(context)}',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickTime,
                child: Text('Pick a Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
