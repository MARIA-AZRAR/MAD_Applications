import 'package:flutter/material.dart';
import 'package:visualapp/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("TabBar App"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.check_box,),
                text: "Checkbox",
              ),
              Tab(
                icon: Icon(Icons.date_range),
                text: "Date&Time Picker",
              ),
              Tab(
                icon: Icon(Icons.radio_button_checked_outlined),
                text: "Radio Button",
              ),
               Tab(
                icon: Icon(Icons.arrow_right_alt),
                text: "Slider",
              ),
               Tab(
                icon: Icon(Icons.switch_left),
                text: "Switch",
              ), 
              Tab(
                icon: Icon(Icons.text_fields),
                text: "TextField",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children:[
            SimpleBarChart(), Text(""), Text(""), Text(""), Text(""), Text(""),
          ],
        ),
      ),
    );
  }
}

