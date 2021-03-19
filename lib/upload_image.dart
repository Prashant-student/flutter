import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  static String routeName = "upload";
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<UploadImage> {
  final ImagePicker _imagePicker = ImagePicker();
  File _image;

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await _imagePicker.getImage(source: source);
    setState(() {
      if (selected != null) {
        _image = File(selected.path);
      }
    });
  }

  uploadImage(String subject, var image) async {
    if (image != null) {
      final ref = FirebaseStorage.instance.ref().child("lol");
      await ref.putFile(image);
      final url = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection("$subject").add({
        "image": url,
        "id": "image",
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var lol = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage(ImageSource.gallery);
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text("No image Selected.")
                : Image.file(
                    _image,
                    height: 400,
                  ),
            ElevatedButton(
              onPressed: () {
                uploadImage(lol, _image);
              },

              // onPressed: () {},
              child: Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
