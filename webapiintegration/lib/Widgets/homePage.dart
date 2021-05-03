import 'package:flutter/material.dart';
import 'heading.dart';
import 'description.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1567446537708-ac4aa75c9c28?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bG9nb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                radius: 100,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(12, 0, 0, 2),
              child: Heading(
                heading: "Description",
              ),
          ),
          Container(
            alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(19, 0, 0, 2),
              child: Description(
                description: "This Application is used to show Navigation between different Routes and API integration to Fetch and Send data from and to server",
              ),
          ),
        ],
      ),
    );
  }
}
