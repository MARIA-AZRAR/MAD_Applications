import 'package:finalproject/components/sidebar.dart';
import 'package:flutter/material.dart';

class audioPlayer extends StatefulWidget {
  audioPlayer({Key? key}) : super(key: key);

  @override
  _audioPlayerState createState() => _audioPlayerState();
}

class _audioPlayerState extends State<audioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Audio Player"),
      ),
      body: Container(
       child: Text("audio"),
    ),
    );
    
  }
}