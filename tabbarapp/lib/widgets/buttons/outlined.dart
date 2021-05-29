import 'package:flutter/material.dart';

class outlinedB extends StatelessWidget {
  const outlinedB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "OutlinedButton",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.lightGreen, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Click Me',
                ),
              ),
              onPressed: () {
                print("I am Pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
