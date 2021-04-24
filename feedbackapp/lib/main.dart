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
      backgroundColor: Colors.white,
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
    return Column(
      //Column for entire feedback form
      crossAxisAlignment: CrossAxisAlignment.start, //Align elements to left
      children: [
        Container(
            //Container for dropdown
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  labelText: 'Sort By',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19)),
              value: dropdownvalue,
              icon: Icon(
                Icons.arrow_drop_down,
                size: 0.0,
                color: Colors.white,
              ),
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
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            )),
        Container(
            //Conatiner for transaction types
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //Align elements to left
              children: [
                Text(
                  "Transaction Types",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Container(
                  //button container
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //Align elements to left
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(12, 21, 12, 21),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        child: Text("Money In", style: TextStyle(fontSize: 15)),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(12, 21, 12, 21),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        child:
                            Text("Money Out", style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
