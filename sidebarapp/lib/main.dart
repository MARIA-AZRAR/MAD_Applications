import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Sidebar App Home Page'),
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
      body: Center(),
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
          ListTile(
            leading: Icon(
              Icons.mail,
              size: 35,
              color: Colors.red,
            ),
            title: Text("Todays"),
            onTap: () => print("Todays Clicked"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text("Products"),
            onTap: () => print("Products Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Direct Materials"),
            onTap: () => print("Direct Materials Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text("Direct Labour"),
            onTap: () => print("Direct Labour Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text("Overheads"),
            onTap: () => print("Overheads Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Customers"),
            onTap: () => print("Customers Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Suppliers"),
            onTap: () => print("Suppliers Clicked"),
          ),
          Divider(
            thickness: 4,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Consultant"),
            onTap: () => print("Consultant Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help"),
            onTap: () => print("Help Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => print("Settings Clicked"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () => print("Logout Clicked"),
          ),
          
        ],
      ),
    );
  }
}
