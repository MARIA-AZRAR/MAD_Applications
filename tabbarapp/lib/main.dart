import 'package:flutter/material.dart';
import './widgets/buttonsTabbar.dart';
import './widgets/InputTabbar.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Sidebar(),
      body: Container(
        child: Column(children: [
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
        ]),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Maria Azrar"),
            accountEmail: Text("Mariaazrar2000@gmail.com"),
            currentAccountPicture: ClipOval(
              child: Image.network(
                  "https://avatars.githubusercontent.com/u/55192319?v=4"),
            ),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.smart_button_sharp),
              title: Text("Buttons Info"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => buttonTabbar()));
              }),
          ListTile(
            leading: Icon(Icons.input),
            title: Text("Input & Selection"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => inputTabbar()));
            },
          )
        ],
      ),
    );
  }
}
