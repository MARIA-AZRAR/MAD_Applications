import 'package:flutter/material.dart';

//MaterialApp as root widgit
void main() => runApp(MaterialApp(
   home: Home()
));


//for hot reload we need to come up with stateless Widgets
//in flutter everything is a Widget Which is a class upuntil now we have
//used build in Widgets like Text() We can build our own Widget as well
//Stateless means that the state of Widget cannot change over time and color texxt layout will remain same
//Stateless Widget make code reusable
//
class Home extends StatelessWidget {
  @override  //override the build function of parent here StatelessWidget
  Widget build(BuildContext context) {  //This build function help in hot reload
    return Scaffold(  //Scaffold is just a wrapper for general layout
     appBar: AppBar(
       title: Text("WhatsUp!"),
       centerTitle: true,
       backgroundColor: Colors.red[600],
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Text("Maria Oh!"),       
         RaisedButton.icon(
          onPressed: () {
            print("Y'all Gonna F**kin Die");
          },
          icon: Icon(
            Icons.mail
          ),
          label: Text(
            "Click me"
          ),
          color: Colors.amber,
        ),
        Container(
          child: IconButton(
            onPressed: () {
              print("YoU kIDdInG");
            },
            icon: Icon(
              Icons.mail,
              size: 30,
              color: Colors.amber,
            ),
          ) 
        ),        
       ],
     ),
     floatingActionButton: FloatingActionButton(
       child: Text("+"),
       onPressed: () {},
       backgroundColor: Colors.red[600],
     ),
     );
  }
}

Container(
       color: Colors.black,
       padding: EdgeInsets.all(20),
       margin: EdgeInsets.all(30),
       child: Center(
       child: IconButton(
         onPressed: () {
           print("YoU kIDdInG");
         },
         icon: Icon(
           Icons.mail,
           size: 60,
           color: Colors.amber,
         ),
       )
       
     ),
     ),

RaisedButton.icon(
         onPressed: () {
           print("Y'all Gonna F**kin Die");
         },
         icon: Icon(
           Icons.mail
         ),
         label: Text(
           "Click me"
         ),
         color: Colors.amber,
       ),

############### SIMPLE BUTTON FORMAT ##################

 child: FlatButton(
         onPressed: () {},
         child: Text(
           "Click me"
         ),
         color: Colors.green,
       ),

##################### SIMPLE ICONS ###################
Icon(
         Icons.account_balance_wallet,
         color: Colors.red,
         size: 50, 
       ),

############### LONG IMAGE FORMAT ##################
       child: Image(
         image: AssetImage('assets/1.jpg'),
       ),

############### SMALL IMAGE FORMAT ##################
      Image.asset('assets/1.jpg')

############### NETWORK IMAGE FORMAT ##################
NetworkImage("https://wallpapercave.com/wp/wp5345126.jpg"),

############### TEXT FORMAT ##################

Text(
         'Hello World',
         style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           letterSpacing: 10.0,
           color: Colors.pink,
           fontFamily: 'TrainOne', 
         ),
       ),