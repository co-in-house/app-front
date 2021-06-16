import 'dart:io';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class NewCommunityIconPage extends StatefulWidget {
  NewCommunityIconPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;
  @override
  _NewCommunityIconState createState() => _NewCommunityIconState();
}

class _NewCommunityIconState extends State<NewCommunityIconPage> {
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          print("path : " + pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } on PlatformException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    }
  }

  Future getImageFromGallery() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          print("path : " + pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } on PlatformException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: getImageFromCamera,
                  // tooltip: 'Pick Image From Camera',
                  child: Icon(Icons.add_a_photo),
                ),
                ElevatedButton(
                  onPressed: getImageFromGallery,
                  // tooltip: 'Pick Image From Gallery',
                  child: Icon(Icons.photo_library),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 300,
                  child: _image == null
                      ? Text('No image selected.')
                      : Image.file(_image)),
            )
          ],
        ),
      ),
    );
  }
}
