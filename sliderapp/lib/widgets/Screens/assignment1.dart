import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Title.dart';
import '../../sidebar.dart';
import '../Description.dart';
import '../AppImages.dart';
import '../AppVideo.dart';

class assgnment1 extends StatelessWidget {
  const assgnment1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     double _height =  MediaQuery.of(context).size.height;
     return Scaffold(
       backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Assignment 1'),
       backgroundColor: Color(0xFF40c8c4),
      ),
      drawer: Sidebar(),
      
      body: ListView(
        children: [
           CarouselSlider(
          
            items: [
               title("Number Checker App"),
               description("A Simple Mobile Application that takes in a number and check if Number is Prime, Composite or Neither one of them."),
               appImage('assets/images/n1.jpg' , _height),
               appImage('assets/images/n2.jpg' , _height),              
               appImage('assets/images/n3.jpg' , _height), 
               appImage('assets/images/n4.jpg' , _height),
               appImage('assets/images/n5.jpg' , _height),
               appVideo(url: 'assets/videos/noappvid.mp4')
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
        ],
      ),
    );
  }
}
