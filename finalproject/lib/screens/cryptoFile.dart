import 'package:finalproject/components/sidebar.dart';
import 'package:flutter/material.dart';

class cryptoScreen extends StatefulWidget {
  cryptoScreen({Key? key}) : super(key: key);

  @override
  _cryptoScreenState createState() => _cryptoScreenState();
}

class _cryptoScreenState extends State<cryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Crypto"),
      ),
      body: Container(
        child: Text("crypto"),
      ),
    );
  }
}
