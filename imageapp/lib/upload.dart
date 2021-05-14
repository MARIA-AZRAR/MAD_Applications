import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

/// Widget to upload image to cloud
class ImageUpload extends StatefulWidget {
  ImageUpload({Key? key, required this.file}) : super(key: key);

  final File? file;

  createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final FirebaseStorage _storage =  FirebaseStorage(storageBucket: 'gs://flutterimageapp-4cbf5.appspot.com');

 //variable to get status of upload
  StorageUploadTask? _imageUploadTask;

  /// Starts an upload task
  void _startUpload() {

    /// Unique file name for the file
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _imageUploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }
  void _clear() {
    setState(() => _imageUploadTask = null);
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUploadTask != null) {

      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _imageUploadTask!.events,
          builder: (_, snapshot) {
            var event = snapshot.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(

                children: [
                  if (_imageUploadTask!.isComplete)
                    Padding(
                      padding: EdgeInsets.all(16),
                      child:  Text('Compeleted 🎉🎉'),
                    ),

                  if (_imageUploadTask!.isPaused)
                    FlatButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: _imageUploadTask!.resume,
                    ),

                  if (_imageUploadTask!.isInProgress)
                    FlatButton(
                      child: Icon(Icons.pause),
                      onPressed: _imageUploadTask!.pause,
                    ),
                  // Progress bar
                  LinearProgressIndicator(value: progressPercent),
                  Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % '
                  ),

                  if (_imageUploadTask!.isSuccessful)
                    FlatButton(
                      child: Icon(Icons.clear),
                      onPressed: _clear,
                    ),

                ],
              );
          });

          
    } else {

      // Allows user to decide when to start the upload
      return ElevatedButton.icon(
          label: Text('Upload to Firebase'),
          icon: Icon(Icons.cloud_upload,
          color: Colors.white,
          ),
          onPressed:_startUpload,
          );

    }
  }
}