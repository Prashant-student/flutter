import 'package:flutter/material.dart';
import 'package:kjsieit_flutter/choice_class.dart';

class Choice extends StatelessWidget {
  static String routeName = "/choice_first";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ChoiceClass.routeName,
                    arguments: "Teachers");
              },
              child: Text("Teachers"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ChoiceClass.routeName,
                    arguments: "Students");
              },
              child: Text("Students"),
            ),
          ],
        ),
      ),
    );
  }
}
