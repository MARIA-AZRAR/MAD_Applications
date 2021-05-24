import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'register.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1461360228754-6e81c478b882?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80"), //"https://images.unsplash.com/photo-1567446537708-ac4aa75c9c28?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bG9nb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                radius: 100,
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.all(24),
            child: ElevatedButton.icon(
              label: Text('Register'),
              icon: Icon(
                Icons.app_registration_rounded,
                color: Colors.white,
              ),
              onPressed: () async {
                String msg = await Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => register()),  
              ); 

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(msg)
                  )
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
