import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextUpload extends StatelessWidget {
  static String routeName = "/upload_text";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController _messageController = TextEditingController();
    String lol = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _messageController,
                validator: (value) =>
                    value.length > 10 ? null : "Enter long message",
                decoration: InputDecoration(
                  labelText: "Enter your message",
                  hintMaxLines: 3,
                  hintText: "Enter your message",
                ),
                maxLines: 3,
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FirebaseFirestore.instance.collection("$lol").add({
                      "id": "text",
                      "text": _messageController.text,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
