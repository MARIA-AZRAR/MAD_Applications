import 'package:flutter/material.dart';
import 'circleIcon.dart';
import './widgets/Screens/assignment1.dart';
import './widgets/Screens/assignment2.dart';
import './widgets/Screens/assignment3.dart';
import './widgets/Screens/assignment4.dart';
import './widgets/Screens/assignment5.dart';
import './widgets/Screens/assignment6.dart';
import './widgets/Screens/assignment7.dart';
import './widgets/Screens/assignment8.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFF40c8c4)
            ),
            accountName: Text("Maria Azrar"),
            accountEmail: Text("Mariaazrar2000@gmail.com"),
            currentAccountPicture: ClipOval(
              child: Image.network(
                  "https://avatars.githubusercontent.com/u/55192319?v=4"),
            ),
          ),
          ListTile(
              leading: circleICon("1"),
              title: Text("Number Checker"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment1())));
              }),
          ListTile(
              leading: circleICon("2"),
              title: Text("AlertDialouge & Card App"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment2())));
              }),
          ListTile(
              leading: circleICon("3"),
              title: Text("Drawer App"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment3())));
              }),
          ListTile(
              leading: circleICon("4"),
              title: Text("DropDown & Toggle Button App"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment4())));
              }),
          ListTile(
              leading: circleICon("5"),
              title: Text("Web Api Integration"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment5())));
              }),
          ListTile(
              leading: circleICon("6"),
              title: Text("Image Upload App"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment6())));
              }),

          ListTile(
              leading: circleICon("7"),
              title: Text("Form App"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment7())));
              }),
          ListTile(
              leading: circleICon("8"),
              title: Text("Tabbar App"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (assgnment8())));
              }),
        ],
      ),
    );
  }
}
