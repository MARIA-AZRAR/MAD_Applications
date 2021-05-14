import 'package:flutter/material.dart';
import 'dart:io';

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

  /// Cropper plugin
  Future<void> _cropImage() async {
    File? croppedImage = await ImageCropper.cropImage(
      sourcePath: _image!.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
      // toolbarColor: Colors.purple,
      // toolbarWidgetColor: Colors.white,
      // toolbarTitle: 'Crop It'
    );

    setState(() {
      _image = croppedImage ?? _image;
    });
  }

  /// Select an image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected =
        await ImagePicker.pickImage(source: source, imageQuality: 50);

    setState(() {
      _image = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _image = null);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: Colors.red,
                      ),
                      title: new Text('Gallery'),
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: Colors.blue,
                    ),
                    title: new Text('Camera'),
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
        Center(
            child: Padding(
               padding: EdgeInsets.all(24),
               child: ImageUpload(file: _image)
        ))
      ],
    );
  }
}
