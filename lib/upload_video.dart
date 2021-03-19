import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadVideo extends StatefulWidget {
  static String routeName = "upload_video";
  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  final ImagePicker _videoPicker = ImagePicker();
  File _video;

  Future<void> _pickVideo(ImageSource source) async {
    PickedFile selected = await _videoPicker.getVideo(source: source);
    setState(() {
      if (selected != null) {
        _video = File(selected.path);
      }
    });
  }

  uploadVideos(String subject, var image) async {
    if (image != null) {
      final ref = FirebaseStorage.instance.ref().child("lol");
      await ref.putFile(image);
      final url = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection("$subject").add({
        "video": url,
        "id": "video",
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
          _pickVideo(ImageSource.gallery);
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _video == null
                ? Text("No image Selected.")
                : BetterPlayer.file(_video.path),
            ElevatedButton(
              onPressed: () {
                uploadVideos(lol, _video);
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
