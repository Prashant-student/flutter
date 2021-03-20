import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kjsieit_flutter/db.dart';
import 'package:kjsieit_flutter/model.dart';

Widget buildBody(var image, var subject) {
  DatabaseService db = DatabaseService();
  return Column(
    children: [
      Image.network(
        image,
        height: 150,
      ),
      Expanded(
        child: StreamBuilder(
          stream: db.getModel(subject),
          builder: (context, AsyncSnapshot<List<Model>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.data[index].id == "text") {
                    return Card(child: Text(snapshot.data[index].text));
                  }
                  if (snapshot.data[index].id == "video") {
                    return BetterPlayer.network(
                      snapshot.data[index].video,
                    );
                  }
                  if (snapshot.data[index].id == "image") {
                    print(snapshot.data[index].image);
                    if (snapshot.data[index].image != null) {
                      print("object");
                      return Image.network(snapshot.data[index].image);
                    }
                    return Container();
                  }
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    ],
  );
}
