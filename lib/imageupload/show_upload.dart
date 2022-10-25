import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowUpload extends StatefulWidget {
  String? userId;

  ShowUpload({Key? key, this.userId}) : super(key: key);

  @override
  State<ShowUpload> createState() => _ShowUploadState();
}

class _ShowUploadState extends State<ShowUpload> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(widget.userId)
            .collection("images")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return (const Center(child: Text("")));
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = snapshot.data!.docs[index]['downloadURL'];
                  return Image.network(
                    url,
                    height: 250,
                    fit: BoxFit.cover,
                  );
                });
          }
        });
  }
}
