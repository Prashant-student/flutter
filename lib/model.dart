class Model {
  final String id;
  final String text;
  final image;
  final video;

  Model({
    this.id,
    this.text,
    this.image,
    this.video,
  });
  Model.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        text = firestore['text'] ?? null,
        image = firestore["image"] ?? null,
        video = firestore["video"] ?? null;
}
