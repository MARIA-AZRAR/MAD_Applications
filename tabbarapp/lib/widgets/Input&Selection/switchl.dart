import 'package:flutter/material.dart';

class switchI extends StatefulWidget {
  switchI({Key? key}) : super(key: key);

  @override
  _switchIState createState() => _switchIState();
}

class _switchIState extends State<switchI> { 
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Switch",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(16),
              child: Switch(

                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                    print(_isSwitched);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
