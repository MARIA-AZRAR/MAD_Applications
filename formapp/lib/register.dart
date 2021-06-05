import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  String? username;
  String? email;
  String? mobileNo;
  String? password;
  bool checked = false;
  RegExp phone_validator = RegExp(r'(^(?:[+0]9)?[0-9]{11}$)');
  RegExp password_validator = RegExp(r'(^(?:[0-9]+[a-zA-Z]|[a-zA-Z]+[0-9])[a-zA-Z0-9]*$)');

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
           child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(14, 14, 14, 1),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 14, 1),
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 14, 10),
                  child: Text(
                    "Signup to Experience New Ways",
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value!.length;
                      if (len == 0) {
                        return "`username` cannot be empty";
                      } else if (len < 4) {
                        return "`username` must be longer than 3 characters";
                      }
                      return null;
                    },
                    onSaved: (value) => username = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'User Name',
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.person, color: Colors.red),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    validator: (value) => !EmailValidator.validate(value)
                        ? "`Email Id` field must be a valid Email"
                        : null,
                    onSaved: (value) => email = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'Email Id',
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.email, color: Colors.red),
                    ),
                  ),
                ),
                ListTile(
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
                    onSaved: (value) => mobileNo = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'Mobile No',
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.phone, color: Colors.red),
                    ),
                  ),
                ),
                ListTile(
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'Enter Password',
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock, color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                    title: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide.none))),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    if (this.formKey.currentState!.validate()) {
                      if(!checked){
                        showAlertDialog(context);
                      }else{
                      this.formKey.currentState!.save();
                        Navigator.pop(context, "Registered Successfully");
                      }              
                    } else {
                      print("Enter Valid Values");
                    }
                  },
                )),
                CheckboxListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "I accept the ",
                          style: TextStyle(color: Colors.blueGrey[200])),
                      TextSpan(
                          text: "Terms & Conditions",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  value: checked,
                  onChanged: (bool? val) {
                    setState(() {
                      checked = val!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )
              ],
            ),
          )),
    )
    );
  }
}


showAlertDialog(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Select Check Box"),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}