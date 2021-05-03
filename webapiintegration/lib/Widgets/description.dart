import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.description}) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 13
      ),
    );
  }
}