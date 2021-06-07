import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class appVideo extends StatefulWidget {
  appVideo({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  _appVideoState createState() => _appVideoState();
} 

class _appVideoState extends State<appVideo> {
  late VideoPlayerController _vidController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _vidController = VideoPlayerController.asset(widget.url);
    _initializeVideoPlayerFuture = _vidController.initialize();

    _vidController.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _vidController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          children: [
            FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _vidController.value.aspectRatio,
                  child: VideoPlayer(_vidController),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF40c8c4),
                  ),
                );
              }
            },
          ),
          Positioned(
            right: 5.0,
            bottom: 0.0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF595386),
              onPressed: () {
                setState(() {
                  if (_vidController.value.isPlaying) {
                    _vidController.pause();
                  } else {
                    _vidController.play();
                  }
                });
              },
              child: Icon(
                _vidController.value.isPlaying ? Icons.pause : Icons.play_arrow,
              )
        )
        
        
        
        // IconButton(
        //   icon: _vidController.value.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        //   onPressed: () {
        //      setState(() {
        //       if (_vidController.value.isPlaying) {
        //         _vidController.pause();
        //       } else {
        //         _vidController.play();
        //       }
        //     });
        //   },
        //   iconSize: 24,
        //   color:  Color(0xFF595386),
        // ),
      ),
    ]
    )
    );
  }
}
