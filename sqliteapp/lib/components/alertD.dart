import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String value,) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(value),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}