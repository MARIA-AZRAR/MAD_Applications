import 'package:flutter/material.dart';

Widget appImage(String url) {
  return Container(
    child: Center(
      child: Image.asset(
        url,
        fit: BoxFit.fitHeight,
      ), 
    ),
  );
}









  // return Container(
  //   margin: EdgeInsets.all(6.0),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(8.0),
  //     image: DecorationImage(
  //       image: AssetImage(url),
  //       fit: BoxFit.fill,
  //     ),
  //   ),
  // );