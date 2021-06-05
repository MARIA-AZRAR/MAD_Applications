import 'package:flutter/material.dart';
import 'buttons/dropDown.dart';
import 'buttons/elevated.dart';
import 'buttons/iconB.dart';
import 'buttons/outlined.dart';
import 'buttons/textB.dart';

class buttonTabbar extends StatelessWidget {
  const buttonTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("TabBar App"),
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