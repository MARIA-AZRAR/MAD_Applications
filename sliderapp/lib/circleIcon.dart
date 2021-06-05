import 'package:flutter/material.dart';

Widget circleICon(String n) {
  return Container(
    alignment: Alignment.center,
    width: 30,
    height: 30,
    child: Text(
      n,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    ),
    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF595386)),
  );
}
