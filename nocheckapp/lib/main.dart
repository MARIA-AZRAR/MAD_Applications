import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Checking Application',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Number Checker'),
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
  TextEditingController numberController = new TextEditingController();
  
  String _result = "";

  void _primeOrComposite() {
    String result = "";
    int num = 0;
    if (numberController.text.isEmpty) {
      result = "Enter Some Text First";
    } else {
      num = int.parse(numberController.text);
      if (num > 2) {
        for (int i = 2; i < num; i++) {
          if (num % i == 0) {
            result = "Composite Number";
            break;
          } else {
            result = "Prime Number";
          }
        }
      } else if (num == 0 || num == 1) {
        result = "Neither Prime nor Composite";
      } else if (num == 2) {
        result = "Prime Number";
      } else {
        result = "Not Valid";
      }
    }
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.0,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500.0,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                    hintText: 'Enter Any Number to Check if Prime or Composite',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: Text(
                _result,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,
                  fontFamily: 'Roboto',
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.amber[500],
          elevation: 5,
        ),
        onPressed: _primeOrComposite,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Check",
            style: TextStyle(
              fontFamily: 'Roboto',
              letterSpacing: 1.0,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
