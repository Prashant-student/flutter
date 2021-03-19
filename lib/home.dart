import 'package:flutter/material.dart';
import 'package:kjsieit_flutter/Detail/detail.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  static String routeName = "/home";
  List<String> subjects = ["Maths", "BEE", "EM", "Physics", "Chemistry"];

  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;
    var image =
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg';
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("LogOut"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Detail.routeName,
                arguments: ({
                  "id": map["id"],
                  "subject": subjects[index],
                  "image": image,
                }),
              );
            },
            child: Card(
                child: Column(
              children: [
                Image.network(
                  image,
                  height: 150,
                ),
                Text(
                  subjects[index],
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
