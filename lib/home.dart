import 'package:flutter/material.dart';
import 'package:kjsieit_flutter/Detail/detail.dart';
import 'package:kjsieit_flutter/theme/theme_button.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool state = true;
  List<String> subjects = ["Maths", "BEE", "EM", "Physics", "Chemistry"];

  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;
    var image =
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg';
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: Text("LogOut"),
                onTap: () {},
              ),
              ChangeThemeButton()
            ],
          ),
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
