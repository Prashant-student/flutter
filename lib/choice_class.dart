import 'package:flutter/material.dart';
import 'package:kjsieit_flutter/home.dart';

class ChoiceClass extends StatefulWidget {
  static String routeName = "/choice_class";

  @override
  _ChoiceClassState createState() => _ChoiceClassState();
}

class _ChoiceClassState extends State<ChoiceClass> {
  String valueYear;
  String valueField;
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final snackBar = SnackBar(content: Text('Select the following'));
    List year = [
      "First Year",
      "Second Year",
      "Thrid Year",
      "Fourth Year",
    ];
    List field = [
      "IT",
      "CS",
      "EXTC",
      "ETRX",
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton(
              hint: Text("Select field"),
              value: valueYear,
              onChanged: (e) {
                setState(() {
                  valueYear = e;
                });
              },
              items: field.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
            DropdownButton(
              hint: Text("Select Year"),
              value: valueField,
              onChanged: (e) {
                setState(() {
                  valueField = e;
                });
              },
              items: year.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
            TextButton(
              onPressed: () {
                (valueField != null && valueYear != null)
                    ? Navigator.pushNamed(context, Home.routeName,
                        arguments: ({
                          "id": id,
                          "field": valueField,
                          "year": valueYear,
                        }))
                    : ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
