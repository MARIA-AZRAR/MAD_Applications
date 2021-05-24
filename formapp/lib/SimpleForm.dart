
import 'package:flutter/material.dart';

class simpleForm extends StatefulWidget {
  simpleForm({Key? key}) : super(key: key);

  @override
  _simpleFormState createState() => _simpleFormState();
}

class _simpleFormState extends State<simpleForm> {
  String? To;
  String? Subject;
  String? Body;

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(16),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ListTile(
             title: TextField(
               onChanged: (value) {
                 To = value;
               },
             decoration: InputDecoration(
               labelText: 'To',
               labelStyle: TextStyle(fontWeight: FontWeight.normal)
             ),
           ),
           ), 
           ListTile(
             title:TextField(
               onChanged: (value) {
                 Subject = value;
               },
             decoration: InputDecoration(
               labelText: 'SUBJECT',
               labelStyle: TextStyle(fontWeight: FontWeight.normal)
             ),
           ),
           ), 
           ListTile(
             title:TextField(
               onChanged: (value) {
                 Body = value;
               },
             decoration: InputDecoration(
               labelText: 'BODY',
               labelStyle: TextStyle(fontWeight: FontWeight.normal)
             ),
           ),
           ),
           ListTile(
             title: RaisedButton(
               child: Text("Submit"),
               onPressed: () {
                 print(To);
                 print(Subject);
                 print(Body);
               },
               )
           ),
         ],
         ),
    );
  }
}