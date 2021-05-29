import 'package:flutter/material.dart';

class elevatedB extends StatelessWidget {
  const elevatedB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
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
            SizedBox(
              height: 10,
            ),
            Text(
              "",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            SizedBox(
              height: 10
            ),
            
          ],
        ),
      ),
    );
  }
}