import 'package:flutter/material.dart';

class dropDownB extends StatefulWidget {
  dropDownB({Key? key}) : super(key: key);

  @override
  _dropDownBState createState() => _dropDownBState();
}

class _dropDownBState extends State<dropDownB> {
  String? _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "DropDownButton",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ), 
            ),
            SizedBox(
              height: 80
            ),

            Container(
              padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.green[100],
            ),
            child: DropdownButton<String>(
            value: _dropDownValue,
            iconEnabledColor: Colors.lightGreen,
            dropdownColor: Colors.lightGreen,
            elevation: 5,
            style: TextStyle(color: Colors.black),
             onChanged: (val) {
              setState(() {
                _dropDownValue = val;
              });
            },
            items: <String> [
              'Flutter Developer',
              'Java Developer',
              'Python Developer',
            ].map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList(),
            hint: Text(
              "Please choose a Professsion",
               style: TextStyle(
                  fontSize: 16,
                  height: 2,
                  color: Colors.black
                  ),
            ),
          ),
            ),
          ],
        ),
      ),
    );
  }
}
