import 'dart:async';

import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:sqliteapp/components/randomNo.dart';

import 'package:sqliteapp/models/user.dart';
import 'package:sqliteapp/database/money_database.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String? name;
  String? phone;
  String? password;
  int? _id;

  RegExp phone_validator = RegExp(r'(^(?:[+0]9)?[0-9]{11}$)');
  RegExp password_validator =
      RegExp(r'(^(?:[0-9]+[a-zA-Z]|[a-zA-Z]+[0-9])[a-zA-Z0-9]*$)');

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.03),
              Text(
                "SIGNUP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Image.asset(
                "assets/images/signup.png",
                height: screenSize.height * 0.35,
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                width: screenSize.width * 0.8,
                child: ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value!.length;
                      if (len == 0) {
                        return "`name` cannot be empty";
                      } else if (len < 4) {
                        return "`name` must be longer than 3 characters";
                      }
                      return null;
                    },
                    onSaved: (value) => name = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'name',
                      filled: true,
                      fillColor: Color(0xFFF1E6FF),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      prefixIcon: Icon(Icons.person, color: Color(0xFF6F35A5)),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.8,
                child: ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value!.length;
                      if (len == 0) {
                        return "`Mobile No` cannot be empty";
                      } else if (!phone_validator.hasMatch(value)) {
                        return "`Mobile No` is not valid. Enter 11 digit number";
                      }
                      return null;
                    },
                    onSaved: (value) => phone = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'phone',
                      filled: true,
                      fillColor: Color(0xFFF1E6FF),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      prefixIcon: Icon(Icons.person, color: Color(0xFF6F35A5)),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.8,
                child: ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value!.length;
                      if (len == 0) {
                        return "`password` cannot be empty";
                      } else if (!password_validator.hasMatch(value)) {
                        return "`password` is not valid. Enter a mix of digit & characters";
                      }
                      return null;
                    },
                    onSaved: (value) => password = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'password',
                      filled: true,
                      fillColor: Color(0xFFF1E6FF),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF6F35A5)),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.8,
                child: ListTile(
                    title: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF6F35A5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide.none))),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    if (this.formKey.currentState!.validate()) {
                      this.formKey.currentState!.save();
                        
                      _id = randomId(1, 50);
                      var user = User(
                        id: _id!,
                        name: name!,
                        phone: phone!,
                        password: password!,
                      );

                      int response =  await MoneyDatabase.instance.insertUser(user);
                    
                      if (response == 1) {
                        Navigator.pop(context, "Registered Successfully");

                      } else {
                         scaffoldKey.currentState!.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red, 
                           content: Text("User was not added")));
                      }
                      List<User> usersN =
                          await MoneyDatabase.instance.getUsers();
                      print(usersN);
                    } else {
                      print("Not validated");
                    }
                  },
                )),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(color: Color(0xFF6F35A5)),
                  ),
                  GestureDetector(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFF6F35A5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
