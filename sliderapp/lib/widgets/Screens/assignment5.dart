import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Title.dart';
import '../../sidebar.dart';
import '../Description.dart';
import '../AppImages.dart';
import '../AppVideo.dart';
import '../vidHeading.dart';

class assgnment5 extends StatelessWidget {
  const assgnment5({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     double _height =  MediaQuery.of(context).size.height;
     return Scaffold(
       backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Assignment 5'),
       backgroundColor: Color(0xFF40c8c4),
      ),
      drawer: Sidebar(),
      
      body: ListView(
        children: [
           CarouselSlider(
          
            items: [
               title("Web API Integration"),
               description("An Application that takes input from user and add record to a web API created in PHP using http post method. The application also shows all the added records using http get method in tabular format using DataTable"),
               appImage('assets/images/w1.jpg' ),
               appImage('assets/images/w2.jpg' ),              
               appImage('assets/images/w3.jpg' ), 
               appImage('assets/images/w4.jpg' ),
               appImage('assets/images/w5.jpg' ),
               
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
            child: appVideo(url: 'assets/videos/webapivid.mp4'),
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}
