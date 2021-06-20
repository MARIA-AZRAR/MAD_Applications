import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Title.dart';
import '../../sidebar.dart';
import '../Description.dart';
import '../AppImages.dart';
import '../AppVideo.dart';
import '../vidHeading.dart';

class assignment8 extends StatefulWidget {
  assignment8({Key? key}) : super(key: key);

  @override
  _assignment8State createState() => _assignment8State();
}

class _assignment8State extends State<assignment8> {
  //String? title;
  TextEditingController _title = TextEditingController()..text = 'Your initial value';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Assignment 8'),
        backgroundColor: Color(0xFF40c8c4),
      ),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: screenSize.width * 0.8,
                  child: ListTile(
                    title: TextFormField(
                      validator: (value) {
                        int len = value!.length;
                        if (len == 0) {
                          return "`name` cannot be empty";
                        } else if (len < 4) {
                          return "`name` must be longer than 3 characters";
                        }
                        return null;
                      },
                      controller: _title,
                      onChanged: (value) => _title.text = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                        ),
                        hintText: 'Title',
                        filled: true,
                        fillColor: Color(0xFFF1E6FF),
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        prefixIcon:
                            Icon(Icons.account_box, color: Color(0xFF6F35A5)),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      if (this.formKey.currentState!.validate()) {
                        print("yes");
                      } else {
                        print("not");
                      }
                      print(_title.text);
                      setState(() {
                        _title.text = "go and kill";
                      });
                    },
                    child: Text("Press me")),
                SizedBox(height: 70),
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: screenSize.width * 0.92,
                      child: Card(
                        color: Color(0xFFF1E6FF),
                        shadowColor: Color(0xFF6F35A5),
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  // padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                                  width: screenSize.width * 0.21,
                                  child: Text("12344566")),
                              Container(
                                  //  padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                                  width: screenSize.width * 0.21,
                                  child: Text(
                                      "this is for the best waud accout you sdnvf sjhf")),
                              Container(
                                  // padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(19, 16, 0, 16),
                                  width: screenSize.width * 0.21,
                                  child: Text("Exppense"))
                            ],
                          ),
                          trailing: Container(
                            width: screenSize.width * 0.19,
                            padding: EdgeInsets.fromLTRB(0, 16, 1, 16),
                            child:
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {},
                                  color: Color(0xFF6F35A5),
                                )
                        
                            ),
                          ),

                          // TextFormField(
                          //   controller: _title,
                          //   onChanged: (value) => _title.text = value,
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //     ),
                          //     hintText: 'Title',
                          //     filled: true,
                          //     fillColor: Color(0xFFF1E6FF),
                          //     hintStyle: TextStyle(color: Colors.grey[700]),
                          //     prefixIcon: Icon(Icons.account_box, color: Color(0xFF6F35A5)),
                          //   ),
                          // ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class assgnment8 extends StatelessWidget {
//   const assgnment8({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//      Size screenSize =  MediaQuery.of(context).size;
//      return Scaffold(
//        backgroundColor: Colors.teal[50],
//       appBar: AppBar(
//         title: Text('Assignment 8'),
//        backgroundColor: Color(0xFF40c8c4),
//       ),
//       drawer: Sidebar(),

//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//         children: [
//           Container(
//                 width: screenSize.width * 0.8,
//                 child: ListTile(
//                   title: TextField(
//                     onChanged: (value) => title = value,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.all(Radius.circular(26)),
//                       ),
//                       hintText: 'Title',
//                       filled: true,
//                       fillColor: Color(0xFFF1E6FF),
//                       hintStyle: TextStyle(color: Colors.grey[700]),
//                       prefixIcon: Icon(Icons.account_box, color: Color(0xFF6F35A5)),
//                     ),
//                   ),
//                 ),
//               ),
//         ],
//       ),
//     ),),
//      );

//   }
// }

//  CarouselSlider(

//   items: [
//      title("Tabbar App"),
//      description("A Mobile Application that have two Screens. One is a screen with Five tabs, to demonstrate five Buttons Widgets, one button per tab. Other is a screen with Six tabs, each to demonstrate Input & Selection Widgets, one widget per tab. It uses TabBar, TabBarView and TabController"),
//      appImage('assets/images/t1.jpg' ),
//      appImage('assets/images/t2.jpg' ),
//      appImage('assets/images/t3.jpg' ),
//      appImage('assets/images/t4.jpg' ),
//      appImage('assets/images/t5.jpg' ),
//      appImage('assets/images/t6.jpg' ),
//      appImage('assets/images/t7.jpg' ),
//      appImage('assets/images/t8.jpg' ),
//      appImage('assets/images/t9.jpg' ),
//      appImage('assets/images/t10.jpg' ),
//      appImage('assets/images/t11.jpg' ),
//      appImage('assets/images/t12.jpg' ),
//      appImage('assets/images/t13.jpg' ),

//   ],

//   //Slider Container properties
//   options: CarouselOptions(
//   height: _height,
//   enlargeCenterPage: true,
//   autoPlay: true,
//   aspectRatio: 16 / 9,
//   autoPlayCurve: Curves.fastOutSlowIn,
//   enableInfiniteScroll: true,
//   autoPlayAnimationDuration: Duration(milliseconds: 96000),
//   viewportFraction: 0.8,
//   )
// ),

// SizedBox(height: 25,),
// vidHeading(),
// Container(
//   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//   child: appVideo(url: 'assets/videos/tabbarvid.mp4'),
// ),
// SizedBox(height: 25,),
