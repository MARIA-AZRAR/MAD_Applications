// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;


// /// Widget to upload image to cloud
// class ImageUpload extends StatefulWidget {
//   ImageUpload({Key? key, required this.base64Image}) : super(key: key);

//   final String base64Image;
//   //final File? file;

//   createState() => _ImageUploadState();
// }

// class _ImageUploadState extends State<ImageUpload> {

//  String status = '';
//  String errorMsg = 'Cannot Upload the image' ;

//  var url = 'https://pcc.edu.pk/ws/file_upload.php';

//  String filename = 'images/${DateTime.now()}.png';
// String base64Image = base64Encode(imageBytes);

//  setStatus(String message) {
//     setState(() {
//       status = message;
//     });
//   }

//   _uploadImage() {
//     setStatus('Uploading Image...');
//     if (widget.file == null) {
//       setStatus(errorMsg);
//       return;
//     }
//     upload();
//   }

//   upload() {
//     http.post(Uri.parse(url), body: {
//       "image": widget.base64Image,
//       "name": filename,
//     }).then((result) {
//       setStatus(result.statusCode == 200 ? result.body : errorMsg);
//     }).catchError((error) {
//       setStatus(error);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//       // Allows user to decide when to start the upload
//       return ElevatedButton.icon(
//           label: Text('Upload'),
//           icon: Icon(Icons.cloud_upload,
//           color: Colors.white,
//           ),
//           onPressed:_uploadImage,
//           );

//     }
//   }