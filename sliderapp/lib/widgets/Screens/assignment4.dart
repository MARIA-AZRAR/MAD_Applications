import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Title.dart';
import '../../sidebar.dart';
import '../Description.dart';
import '../AppImages.dart';
import '../AppVideo.dart';
import '../vidHeading.dart';

class assgnment4 extends StatelessWidget {
  const assgnment4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     double _height =  MediaQuery.of(context).size.height;
     return Scaffold(
       backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Assignment 4'),
       backgroundColor: Color(0xFF40c8c4),
      ),
      drawer: Sidebar(),
      
      body: ListView(
        children: [
           CarouselSlider(
          
            items: [
               title("DropDown Button & Toggle Button"),
               description("A Mobile Application that uses dropdown button, toggle button and checkbox to complete a form that takes input from user."),
               appImage('assets/images/f1.jpg' , _height),
               appImage('assets/images/f2.jpg' , _height),              
               appImage('assets/images/f3.jpg' , _height), 
               appImage('assets/images/f4.jpg' , _height),
               appVideo(url: 'assets/videos/feedbackvid.mp4'),
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
            child:   appVideo(url: 'assets/videos/drawervid.mp4'),
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}
