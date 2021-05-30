import 'package:flutter/material.dart';

class sliderI extends StatefulWidget {
  sliderI({Key? key}) : super(key: key);

  @override
  _sliderIState createState() => _sliderIState();
}

class _sliderIState extends State<sliderI> {
  double _currentValue = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Slider",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              label: _currentValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
