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
      alignment: Alignment.topLeft,
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
              height: 10,
            ),
            Text(
              "       Dropdown Button to display any Dropdown List item as we can change its style according to it. Such as its background color, border secular etc. As this Dropdown list because it is a clickable widget. Which shows the list item we have selected. The Dropdown Button has DropDownMenuItem. We initialize whatever is to be shown in the list. and the Dropdown button has a function named onChnaged. When a user clicks on an item from the dropdown. So it triggers and executes the triggered function.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            SizedBox(
              height: 50
            ),
            DropdownButton<String>(
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

          ],
        ),
      ),
    );
  }
}
