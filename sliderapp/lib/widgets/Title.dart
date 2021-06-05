import 'package:flutter/material.dart';

Widget title(String _title){
  return Container(
    alignment: Alignment.center,
    child: Text(
      _title,
       textAlign: TextAlign.center,
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 24
       ),
    ),
  );
}