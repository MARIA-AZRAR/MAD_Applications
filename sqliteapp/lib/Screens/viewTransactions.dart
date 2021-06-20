import 'package:flutter/material.dart';

class ViewTransactions extends StatefulWidget {
  ViewTransactions({Key? key}) : super(key: key);

  @override
  _ViewTransactionsState createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Text("transaction"),

    );
  }
}