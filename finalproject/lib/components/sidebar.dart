import 'package:flutter/material.dart';

import '../screens/audioPlayer.dart';
import '../screens/cryptoFile.dart';
import '../screens/sharedPreferences.dart';
import '../screens/urlLauncher.dart';
import '../main.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

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
            leading: Icon(Icons.share),
            title: Text("Shared Preferences"),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(
                 builder: (context) => (MyHomePage(title: "Shared Preferences" ,))));
            },
          ),
          ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("Excel Launcher"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                 builder: (context) => (urlLauncher())));
            },
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Audio Player"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                 builder: (context) => (audioPlayer())));
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Crypto"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                 builder: (context) => (cryptoScreen())));
            },
          ),
          
        ],
      ),
    );
  }
}