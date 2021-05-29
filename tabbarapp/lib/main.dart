import 'package:flutter/material.dart';
import './widgets/buttons/dropDown.dart';
import './widgets/buttons/elevated.dart';
import './widgets/buttons/iconB.dart';
import './widgets/buttons/outlined.dart';
import 'widgets/buttons/textB.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'TabBar App'),
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
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.arrow_drop_down_circle,),
                text: "DropDownButton",
              ),
              Tab(
                icon: Icon(Icons.smart_display),
                text: "ElevatedButton",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "IconButton",
              ),
               Tab(
                icon: Icon(Icons.smart_display_outlined),
                text: "OutlinedButton",
              ),
               Tab(
                icon: Icon(Icons.text_fields),
                text: "TextButton",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children:[
            dropDownB(), elevatedB(), iconB(), outlinedB(), textB(),
          ],
        ),
      ),
    );
  }
}
