import 'package:flutter/material.dart';
import 'Widgets/homePage.dart';
import 'Widgets/drawer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Consumer Data Application'),
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
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        title: Text(widget.title),
      ),
      drawer: Sidebar(),
      body: SingleChildScrollView( 
        child: Container(
        child: HomePage() 
      )
      )
    );
  }
}
