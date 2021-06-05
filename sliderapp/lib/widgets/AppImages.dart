import 'package:flutter/material.dart';

Widget appImage(String url, double _height) {
  return Container(
    child: Center(
      child: Image.asset(
        url,
        fit: BoxFit.cover,
        height: _height,
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