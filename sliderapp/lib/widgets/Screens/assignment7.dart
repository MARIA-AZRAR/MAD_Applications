import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Title.dart';
import '../../sidebar.dart';
import '../Description.dart';
import '../AppImages.dart';
import '../AppVideo.dart';

class assgnment7 extends StatelessWidget {
  const assgnment7({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Assignment 7'),
        backgroundColor: Color(0xFF40c8c4),
      ),
      drawer: Sidebar(),
      body: ListView(
        children: [
          CarouselSlider(
              items: [
                title("Flutter Forms"),
                description(
                    "A Mobile Application that takes data from user using TextFormField. All the data is validated and if according to format submitted successfully"),
                appImage('assets/images/r1.jpg', _height),
                appImage('assets/images/r3.jpg', _height),
                appImage('assets/images/r4.jpg', _height),
                appImage('assets/images/r5.jpg', _height),
                appVideo(url: 'assets/videos/formappvid.mp4'),

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
              )),
          Container(
            child: Center(
              child: Image.asset(
                'assets/images/r2.jpg',
                fit: BoxFit.cover,
                height: _height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
