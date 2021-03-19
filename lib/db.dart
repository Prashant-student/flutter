import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kjsieit_flutter/model.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Stream<List<Model>> getModel(var subject) {
    var lol;
    lol = _db.collection("$subject").snapshots().map((snapshot) =>
        snapshot.docs.map((e) => Model.fromFirestore(e.data())).toList());
    return lol;
  }
}
