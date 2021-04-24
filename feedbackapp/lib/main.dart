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
      body: Feeback(context),
    );
  }
}


Widget Feeback(BuildContext context) {
  return Row(
    children: [
      Text("I am here")
    ],
  );
}
