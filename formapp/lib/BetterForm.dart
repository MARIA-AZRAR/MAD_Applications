import 'package:flutter/material.dart';

class betterForm extends StatefulWidget {
  betterForm({Key? key}) : super(key: key);

  @override
  _betterFormState createState() => _betterFormState();
}

class _betterFormState extends State<betterForm> {
  String? To;
  String? Subject;
  String? Body;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: TextFormField(
              validator: (value) => !value!.contains('@') ? "`TO` field must be a valid email" : null,
              onSaved: (value) => To = value,
              decoration: InputDecoration(
                  labelText: 'To',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal)),
            ),
          ),
          ListTile(
            title: TextFormField(
              validator: (value) {
                int len = value!.length;
                if(len == 0){
                  return "`SUBJECT` cannot be empty";
                 }
                else if(len < 4){
                  return "`SUBJECT` must be longer than 4 characters";
                }
                return null; 
              },
              onSaved: (value) => Subject = value,
              decoration: InputDecoration(
                  labelText: 'SUBJECT',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal)),
            ),
          ),
          ListTile(
            title: TextFormField(
              onSaved: (value) => Body = value ,
              decoration: InputDecoration(
                  labelText: 'BODY',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal)),
              maxLines: 9,
            ),
          ),
          ListTile(
              title: RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if(this.formKey.currentState!.validate()){
                this.formKey.currentState!.save();
                print(To);
                print(Subject);
                print(Body);
              }else{
                print("Something's Wrong");
              }
              
            },
          )),
        ],
      ),
    ));
  }
}
