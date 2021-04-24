import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FeedBack Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sort & Filter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          //for the cross icon we need to use row
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 25, 10, 25),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            Text(widget.title),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              "Clear",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              print("Clear Pressed");
            },
          ),
          TextButton(
            child: Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              print("Apply Pressed");
            },
          ),
        ],
      ),
      body: Feedback(),
    );
  }
}

class Feedback extends StatefulWidget {
  Feedback({Key? key}) : super(key: key);
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  String dropdownvalue = 'Newest First';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            child: DropdownButton(
          value: dropdownvalue,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 0.0,
            color: Colors.white,
            ),
          underline: Container(height: 0.0),
          onChanged: (String? newV) {
            setState(() {
              dropdownvalue = newV!;
            });
          },
          items: <String>[
            'Newest First',
            'Oldest First',
            'Value High-Low',
            'Value Low-High'
          ].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
      ],
    );
  }
}


/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
