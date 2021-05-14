import 'package:flutter/material.dart';
import 'drawer.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AddRecords extends StatefulWidget {
  AddRecords({Key? key}) : super(key: key);

  @override
  _AddRecordsState createState() => _AddRecordsState();
}

//declaring global controller
TextEditingController _firstNameController = new TextEditingController();
TextEditingController _lastNameController = new TextEditingController();
TextEditingController _genderController = new TextEditingController();
TextEditingController _emailController = new TextEditingController();
TextEditingController _phoneController = new TextEditingController();

late var navigatorKey;

class _AddRecordsState extends State<AddRecords> {
  @override
  Widget build(BuildContext context) {
    navigatorKey = context;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Add Consumer Record"),
        ),
        drawer: Sidebar(),
        body: Container(
            padding: EdgeInsets.fromLTRB(100, 50, 100, 14),
            child: new Column(children: [
              new ListTile(
                leading: const Icon(Icons.person),
                title: new TextField(
                  controller: _firstNameController,
                  decoration: new InputDecoration(
                    hintText: "First Name",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.person),
                title: new TextField(
                  controller: _lastNameController,
                  decoration: new InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.person_add_alt_rounded),
                title: new TextField(
                  controller: _genderController,
                  decoration: new InputDecoration(
                    hintText: "Gender",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.email),
                title: new TextField(
                  controller: _emailController,
                  decoration: new InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.phone),
                title: new TextField(
                  controller: _phoneController,
                  decoration: new InputDecoration(
                    hintText: "Phone",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton.icon(
                  padding: EdgeInsets.all(20),
                  onPressed: consumerRegisteration,
                  icon: Icon(
                    Icons.upload,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  label: Text("Submit"),
                  color: Colors.teal,
                  elevation: 6,
                ),
              ),
            ])));
  }
}

Future consumerRegisteration() async {
  String fistName = _firstNameController.text;
  String lastName = _lastNameController.text;
  String gender = _genderController.text;
  String email = _emailController.text;
  String phone = _phoneController.text;

  var url = "https://pcc.edu.pk/ws/create/rs_consumers.php";

  var data = {
    'firstName': fistName,
    'lastName': lastName,
    'gender': gender,
    'email': email,
    'phone': phone
  };

  var response = await http.post(Uri.parse(url), body: json.encode(data));

  var message = jsonDecode(response.body);

  if (response.statusCode == 200) {
    showDialog(
      context: navigatorKey,
      builder: (context) {
        return AlertDialog(
          title: Text("Response Message"),
          content: Text(message['message']),
          elevation: 8,
          contentPadding: EdgeInsets.fromLTRB(20, 40, 20, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            FlatButton(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 16),
              child: Text("OK", style: TextStyle(color: Colors.blue),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
