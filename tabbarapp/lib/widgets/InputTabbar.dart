import 'package:flutter/material.dart';

import 'Input&Selection/checkBoxI.dart';
import 'Input&Selection/dateTimeI.dart';
import 'Input&Selection/radioI.dart';
import 'Input&Selection/sliderI.dart';
import 'Input&Selection/switchl.dart';
import 'Input&Selection/textFieldI.dart';

class inputTabbar extends StatelessWidget {
  const inputTabbar({Key? key}) : super(key: key);

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
            checkBoxI(), dateTimeI(),radioI(),sliderI(),switchI(),textFieldI(),
          ],
        ),
      ),
    );
  }
}