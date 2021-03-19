import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kjsieit_flutter/Detail/body.dart';
import 'package:kjsieit_flutter/text_upload.dart';
import 'package:kjsieit_flutter/upload_image.dart';

import '../upload_video.dart';

class Detail extends StatefulWidget {
  static String routeName = "/Detail";

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Map lol = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: (lol["id"] == "Teachers")
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Upload"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UploadImage.routeName,
                                    arguments: lol["subject"]);
                              },
                              child: Text("Image")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UploadVideo.routeName,
                                    arguments: lol["subject"]);
                              },
                              child: Text("Video")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, TextUpload.routeName,
                                    arguments: lol["subject"]);
                              },
                              child: Text("Text")),
                        ],
                      );
                    });
              },
              child: Icon(Icons.add),
            )
          : null,
      body: buildBody(
        lol["image"],
        lol["subject"],
      ),
    );
  }
}
