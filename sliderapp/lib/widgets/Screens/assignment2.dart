import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Title.dart';
import '../../sidebar.dart';
import '../Description.dart';
import '../AppImages.dart';
import '../AppVideo.dart';
import '../vidHeading.dart';

class assgnment2 extends StatelessWidget {
  const assgnment2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     double _height =  MediaQuery.of(context).size.height;
     return Scaffold(
       backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Assignment 2'),
       backgroundColor: Color(0xFF40c8c4),
      ),
      drawer: Sidebar(),
      
      body: ListView(
        children: [
           CarouselSlider(
          
            items: [
               title("AlertDialog & Card Application"),
               description("A Mobile Application that that uses card to display image and asks question from user. If user clicks right button alertBox comes with correct and if wrong alertBox comes with wrong"),
               appImage('assets/images/c1.jpg' ),
               appImage('assets/images/c2.jpg' ),              
               appImage('assets/images/c3.jpg' ),
            ],

            //Slider Container properties
            options: CarouselOptions(
            height: _height,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 96000),
            viewportFraction: 0.8,
            )
          ),          
          SizedBox(height: 25,),
          vidHeading(),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: appVideo(url: 'assets/videos/cardappvid.mp4'), 
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}
