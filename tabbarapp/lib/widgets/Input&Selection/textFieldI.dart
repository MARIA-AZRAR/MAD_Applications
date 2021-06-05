import 'package:flutter/material.dart';

class textFieldI extends StatefulWidget {
  textFieldI({Key? key}) : super(key: key);

  @override
  _textFieldIState createState() => _textFieldIState();
}

enum FavouriteMovie { longestRide, meBeforeYou, aWalkToRemember }

class _textFieldIState extends State<textFieldI> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Text Field",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Any Value",
                    ),
                )),
          ],
        ),
      ),
    );
  }
}
