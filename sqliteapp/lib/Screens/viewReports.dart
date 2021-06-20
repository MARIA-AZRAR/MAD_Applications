import 'package:flutter/material.dart';
import '../components/drawerS.dart';
import '../models/user.dart';

class viewReports extends StatefulWidget {
  viewReports({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _viewReportsState createState() => _viewReportsState();
}

class _viewReportsState extends State<viewReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(this.widget.user),
      backgroundColor: Colors.white,
      body: Text("Reports"),
    );
  }
}
