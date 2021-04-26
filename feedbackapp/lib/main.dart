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
  List<bool> _ifSelectedTransaction = [false, false];

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

                //Container for buttons
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ToggleButtons(
                              fillColor: Colors.blueGrey.shade300,
                              splashColor: Colors.blue.shade100,
                              borderColor: Colors.black,
                              borderWidth: 1.7,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              children: [
                                //using different buttons
                                Container(
                                    //conatiner for 1 button
                                    padding: EdgeInsets.all(25),
                                    width: (MediaQuery.of(context).size.width -
                                            50) /
                                        2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Money In",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Container(
                                    //conatiner for 1 button
                                    width: (MediaQuery.of(context).size.width -
                                            50) /
                                        2,
                                    padding: EdgeInsets.all(25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Money Out",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ],
                              isSelected: _ifSelectedTransaction,
                              onPressed: (int index) {
                                setState(() {
                                  _ifSelectedTransaction[index] =
                                      !_ifSelectedTransaction[index];
                                });
                              }),
                        ])),
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

        Divider(),

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
                ToggleButtons(
                    fillColor: Colors.blueGrey.shade300,
                    splashColor: Colors.blue.shade100,
                    borderColor: Colors.black,
                    borderWidth: 1.7,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    children: [
                      //using different buttons
                      Container(
                          //conatiner for 1 button
                          padding: EdgeInsets.all(10),
                          width: (MediaQuery.of(context).size.width - 30) / 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MaterialButton(
                                //used to make circul against icon in button
                                onPressed: null,
                                disabledColor: Colors.green,
                                child: Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                              ),
                              Text(
                                "Good",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                      Container(
                          //conatiner for 1 button
                          width: (MediaQuery.of(context).size.width - 30) / 3,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MaterialButton(
                                //used to make circul against icon in button
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
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                      Container(
                          //conatiner for 1 button
                          width: (MediaQuery.of(context).size.width - 30) / 3,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MaterialButton(
                                //used to make circul against icon in button
                                onPressed: null,
                                disabledColor: Colors.red,
                                child: Icon(
                                  Icons.thumb_down_alt_outlined,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                              ),
                              Text(
                                "Bad",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                    ],
                    isSelected: _ifSelected,
                    onPressed: (int index) {
                      setState(() {
                        _ifSelected[index] = !_ifSelected[index];
                      });
                    }),

                Divider(),

                checkBoxM(listValue: 'Consultant Notes Only'),

                Divider(),

                checkBoxM(listValue: 'Overdue Only'),

                Divider(),

                checkBoxM(listValue: 'Date Range'),

                //Date picker
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text("From", style: TextStyle(fontSize: 12)),
                          ),
                          datePick(startValue: "_")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text("To", style: TextStyle(fontSize: 12)),
                          ),
                          datePick(
                            startValue: "Today",
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    ));
  }
}

class datePick extends StatefulWidget {
  datePick({Key? key, required this.startValue}) : super(key: key);
  final String startValue;

  @override
  _datePickState createState() => _datePickState();
}

class _datePickState extends State<datePick> {
  DateTime currentDate = DateTime.now();
  bool flag = true;
  //Date and Time Picker Created
  Future<Null> _dateSelector(BuildContext context) async {
    final DateTime? dateSelected = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2111));
    if (dateSelected != null)
      setState(() {
        currentDate = dateSelected;
        flag = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _dateSelector(context),
      child: Text(
        flag
            ? widget.startValue
            : "${currentDate.day} - ${currentDate.month} - ${currentDate.year}",
        style: TextStyle(
          shadows: [Shadow(color: Colors.black, offset: Offset(0, -10))],
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
          decorationThickness: 1,
        ),
      ),
    );
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

