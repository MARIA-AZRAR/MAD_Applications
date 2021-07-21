import 'package:finalproject/components/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





class sharedPreferences extends StatefulWidget {
  sharedPreferences({Key? key}) : super(key: key);

  @override
  _sharedPreferencesState createState() => _sharedPreferencesState();
}

class _sharedPreferencesState extends State<sharedPreferences> {

  int totalVisited = 0;
  SharedPreferences? preferences;


 @override
   void initState() { 
     super.initState();
     initializePreference().whenComplete((){
       setState(() {
      totalVisited  = this.preferences?.getInt("total") ?? 0;
      totalVisited++;
      this.preferences?.setInt("total", totalVisited);
       });
     });
      
     
   }

    Future<void> initializePreference() async{
     this.preferences = await SharedPreferences.getInstance();
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Center(
             child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Total User Visited",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6.0,    
                ),
              ),
            ),
           ),

           Center(
             child: Container(
              padding: EdgeInsets.all(50),
              child: Text(
                '${this.preferences?.getInt("total") ?? 0}',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,    
                ),
              ),
            ),
           )
         ],
       ),
    );
  }
}


// addintToSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt('intValue', (getintValuesSF() + 1));
// }


// getintValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return int
//   int? intValue = prefs.getInt('intValue') ?? 0;
 
//   return intValue;
// }