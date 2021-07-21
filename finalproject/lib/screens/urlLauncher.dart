import 'package:finalproject/components/sidebar.dart';
import 'package:flutter/material.dart';

class urlLauncher extends StatefulWidget {
  urlLauncher({Key? key}) : super(key: key);

  @override
  _urlLauncherState createState() => _urlLauncherState();
}

class _urlLauncherState extends State<urlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Excel Launcher"),
      ),
      body: Container(
       child: Text("Url"),
    ),
    );
  }
}