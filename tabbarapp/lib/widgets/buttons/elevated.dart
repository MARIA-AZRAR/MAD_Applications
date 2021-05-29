import 'package:flutter/material.dart';

class elevatedB extends StatelessWidget {
  const elevatedB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "ElevatedButton",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
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
