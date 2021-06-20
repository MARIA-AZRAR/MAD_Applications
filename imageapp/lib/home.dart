import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'upload.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}


class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  String status = 'No Image Selected';
  String errorMsg = 'Cannot Upload the image' ;
  var url = 'https://pcc.edu.pk/ws/file_upload.php';

  String filename = ' ';  
  String base64Image = '';

   /// Cropper plugin
    Future<void> _cropImage() async {
    File? croppedImage = await ImageCropper.cropImage(
      sourcePath: _image!.path,
      maxWidth: 512,
      maxHeight: 512,
    );

    setState(() {
      _image = croppedImage ?? _image;
    });
  }

  /// Select an image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected =  await ImagePicker.pickImage(
      source: source, imageQuality: 50);

    setStatus("Image Selected");

    setState(() {
      _image = selected;
    });
  }

  /// Remove image
  void _clear() {
    setStatus('No Image Selected');
    setState(() => _image = null);
  }




  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                   ListTile(
                      leading:  Icon(
                        Icons.photo_library,
                        color: Colors.red,
                      ),
                      title:  Text('Gallery'),
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                     ListTile(
                    leading:  Icon(
                      Icons.photo_camera,
                      color: Colors.blue,
                    ),
                    title: Text('Camera'),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


//Upload Image

 setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  _uploadImage() {
    setStatus('Uploading Image...');
    if (_image == null) {
      setStatus('Cannot Upload No Image Selected');
      print("No Upload");

    }else{
      base64Image = base64Encode(_image!.readAsBytesSync());
      filename = 'images/${DateTime.now()}.png';
      upload(); 
    }
  }

  upload() {
    http.post(Uri.parse(url), body: {
      "image": base64Image,
      "name": filename,
    }).then((result) {
      setStatus(result.statusCode == 200 ? jsonDecode(result.body)['message'] : errorMsg);
    }).catchError((error) {
      setStatus(error);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.deepOrange.shade100, //Color(0xffFDCF09),
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.file(
                        _image!,
                        width: 300,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange.shade100,
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        semanticLabel: "select",
                        size: 70,
                        color: Colors
                            .deepOrangeAccent.shade700, //Colors.grey[800],
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Icon(Icons.crop,
                  size: 40, color: Colors.deepOrangeAccent.shade700),
              onPressed: _cropImage,
            ),
            FlatButton(
              child: Icon(Icons.refresh,
                  size: 40, color: Colors.deepOrangeAccent.shade700),
              onPressed: _clear,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
         child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(status)
        ),
        ),
        Center(
            child: Padding(
               padding: EdgeInsets.all(24),
               child: ElevatedButton.icon(
                label: Text('Upload'),
                icon: Icon(Icons.cloud_upload,
                color: Colors.white,
                ),
                onPressed:_uploadImage,
                ),

        ))
      ],
    );
  }
}
