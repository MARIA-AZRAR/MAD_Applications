import 'package:flutter/material.dart';

Widget description(String _description){
  return Container(
    alignment: Alignment.center,
    child: Text(
      _description,
       textAlign: TextAlign.center,
       style: TextStyle(
         fontSize: 24
       ),
    ),
  );
}