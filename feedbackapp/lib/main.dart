import 'dart:html';

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
  List<bool> _ifSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
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
                  CrossAxisAlignment.stretch, //Align elements to left
              children: [
                Text(
                  "Transaction Types",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Center(
                  //to center buttons
                  child: Container(
                    width:
                        196, //Specifying the container width so that with position buttons can move and overlap in container
                    child: Stack(
                      //using stack instead of column to overlap buttons
                      children: [
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.black, width: 1.1),
                          ),
                          onPressed: () {},
                          color: Colors.white,
                          textColor: Colors.black,
                          child:
                              Text("Money In", style: TextStyle(fontSize: 15)),
                        ),
                        Positioned(
                          //with the help of positioned button A can move freely
                          right: 0,
                          top: 0,
                          child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.black, width: 1.1),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Text("Money Out",
                                style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        checkBoxM(listValue: 'Shop'),
        checkBoxM(listValue: 'Credit'),
        checkBoxM(listValue: 'Refund'),
        checkBoxM(listValue: 'Loan'),
        checkBoxM(listValue: 'Direct Material'),
        checkBoxM(listValue: 'Direct Labour'),
        checkBoxM(listValue: 'Asset'),
        checkBoxM(listValue: 'Other'),
        checkBoxM(listValue: 'Overhead'),

        Divider(thickness: 2),

        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Transaction Health",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            textAlign: TextAlign.left,
          ),
        ),
        //Toggle Button Container
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToggleButtons(children: [
                  //using different buttons
                  Container(
                      //conatiner for 1 button
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 30) / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.green,
                          ),
                          Text("Good")
                        ],
                      )),
                  Container(
                      //conatiner for 1 button
                      width: (MediaQuery.of(context).size.width - 30) / 3,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(  //used to make circul against icon in button
                            onPressed: null,
                            disabledColor: Colors.amber,
                            child: Icon(
                              Icons.thumb_down_alt_outlined,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.all(12),
                            shape: CircleBorder(),
                          ),
                          Text(
                            "Ok",
                            style: TextStyle(color: Colors.black),),
                        ],
                      )),
                  Container(
                      //conatiner for 1 button
                      width: (MediaQuery.of(context).size.width - 30) / 3,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.red,
                          ),
                          Text("Bad")
                        ],
                      )),
                ], isSelected: _ifSelected)
              ],
            )),

        // Container(
        //   width: MediaQuery.of(context).size.width * 1,  //take entire screen width
        //   color: Colors.amber,
        //   child: Text("Hey Whats up its been a while ")
        // )
      ],
    ));
  }
}

class checkBoxM extends StatefulWidget {
  checkBoxM({Key? key, required this.listValue}) : super(key: key);
  final String listValue;
  @override
  _checkBoxMState createState() => _checkBoxMState();
}

class _checkBoxMState extends State<checkBoxM> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.listValue),
        value: checked,
        onChanged: (bool? val) {
          setState(() {
            checked = val!;
          });
        });
  }
}

// Padding(
//                         padding: EdgeInsets.all(9),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                               Icon(Icons.circle),
//                               Text("Good"),
//                           ],
//                           ),
//                         ),

// ToggleButtons(
//   children: [
//     Padding(
//         padding: EdgeInsets.all(8), child: Text("Good")),
//     Padding(
//         padding: EdgeInsets.all(8), child: Text("Good")),
//     Padding(
//         padding: EdgeInsets.all(8), child: Text("Good")),
//   ],
//   isSelected: _ifSelected,
// )
