import 'package:flutter/material.dart';
import 'package:sqliteapp/models/user.dart';

import '../Screens/viewAccounts.dart';
import '../Screens/viewTransactions.dart';
import '../Screens/viewReports.dart';


class Sidebar extends StatelessWidget {
  Sidebar(this.user);

  final User? user;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFF6F35A5)
            ),
            accountName: Text(this.user!.name),
            accountEmail: Text(this.user!.phone),
            currentAccountPicture: ClipOval(
              child: Image.network(
                  "https://avatars.githubusercontent.com/u/55192319?v=4"),
            ),
          ),
          ListTile(
              leading: Icon(Icons.account_box, color: Color(0xFF6F35A5),),
              title: Text("Accounts"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (viewAccounts(user: user,))));
              }),
          ListTile(
              leading: Icon(Icons.money, color: Color(0xFF6F35A5),),
              title: Text("Transactions"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (viewTransactions(user: user))));
              }),
          ListTile(
              leading: Icon(Icons.document_scanner, color: Color(0xFF6F35A5),),
              title: Text("Reports"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (viewReports(user: user))));
              }),
        ],
      ),
    );
  }
}
 