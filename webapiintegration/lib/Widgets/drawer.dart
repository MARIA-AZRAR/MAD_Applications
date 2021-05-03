import 'package:flutter/material.dart';
import 'AddRecords.dart';
import 'ShowRecords.dart';
import '../main.dart';

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
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => MyApp()),  
              );  
            },
          ),
          ListTile(
            leading: Icon(Icons.file_upload_sharp),
            title: Text("Add Records"),
            onTap: () {
              Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => AddRecords()),  
              );  
            },
          ),
          ListTile(
            leading: Icon(Icons.file_download_sharp),
            title: Text("Show Records"),
            onTap: () {
              Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => ShowRecords()),  
              );  
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
