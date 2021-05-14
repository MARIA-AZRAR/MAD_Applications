import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Editor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageCapture(title: "Image Editor",),
//     );
//   }
// }

// /// Widget to capture and crop the image
// class ImageCapture extends StatefulWidget {
//    ImageCapture({Key? key, required this.title}) : super(key: key);

//   final String title;
//   createState() => _ImageCaptureState();
// }

// class _ImageCaptureState extends State<ImageCapture> {
//   /// Active image file
//   File? _imageFile;

//   /// Cropper plugin
//   Future<void> _cropImage() async {
//     File? cropped = await ImageCropper.cropImage(
//         sourcePath: _imageFile!.path,
//         // ratioX: 1.0,
//         // ratioY: 1.0,
//         maxWidth: 512,
//         maxHeight: 512,
//         // toolbarColor: Colors.purple,
//         // toolbarWidgetColor: Colors.white,
//         // toolbarTitle: 'Crop It'
//       );

//     setState(() {
//       _imageFile = cropped ?? _imageFile;
//     });
//   }

//   /// Select an image via gallery or camera
//   Future<void> _pickImage(ImageSource source) async {
//     File selected = await ImagePicker.pickImage(source: source);

//     setState(() {
//       _imageFile = selected;
//     });
//   }

//   /// Remove image
//   void _clear() {
//     setState(() => _imageFile = null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       // Select an image from the camera or gallery
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.photo_camera),
//               onPressed: () => _pickImage(ImageSource.camera),
//             ),
//             IconButton(
//               icon: Icon(Icons.photo_library),
//               onPressed: () => _pickImage(ImageSource.gallery),
//             ),
//           ],
//         ),
//       ),

//       // Preview the image and crop it
//       body: ListView(
//         children: <Widget>[
//           if (_imageFile != null) ...[

//             Image.file(_imageFile!),

//             Row(
//               children: <Widget>[
//                 FlatButton(
//                   child: Icon(Icons.crop),
//                   onPressed: _cropImage,
//                 ),
//                 FlatButton(
//                   child: Icon(Icons.refresh),
//                   onPressed: _clear,
//                 ),
//               ],
//             ),

//           //  Uploader(file: _imageFile)
//           ]
//         ],
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(title: 'Image Editor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade200,
        title: Text(widget.title,
        style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: ImagePickerWidget(),
    );
  }
}
