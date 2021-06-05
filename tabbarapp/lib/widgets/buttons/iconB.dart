import 'package:flutter/material.dart';

class iconB extends StatelessWidget {
  const iconB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text( 
              "IconButton",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightGreen,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.favorite),
                color: Colors.black,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
