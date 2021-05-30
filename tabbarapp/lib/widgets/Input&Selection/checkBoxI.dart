import 'package:flutter/material.dart';

class checkBoxI extends StatefulWidget {
  checkBoxI({Key? key}) : super(key: key);

  @override
  _checkBoxIState createState() => _checkBoxIState();
}

class _checkBoxIState extends State<checkBoxI> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Checkbox",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            Checkbox(
                value: _checked,
                onChanged: (bool? val) {
                  setState(() {
                    _checked = val!;
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}
