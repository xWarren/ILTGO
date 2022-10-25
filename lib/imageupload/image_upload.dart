import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  String? userId;

  ImageUpload({Key? key, this.userId}) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadUrl;

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No file selected", Duration(milliseconds: 400));
      }
    });
  }

  //select image
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //upload image
  Future uploadImage() async {
    final postID = DateTime.now().microsecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}/images")
        .child("post_$postID");

    await ref.putFile(_image!);
    downloadUrl = await ref.getDownloadURL();

    //upload to firebase
    await firebaseFirestore
        .collection("users")
        .doc(widget.userId)
        .collection("images")
        .add({'downloadURL': downloadUrl}).whenComplete(() =>
            showSnackBar("Image uploaded sucessfully", Duration(seconds: 2)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Upload")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Column(
                children: [
                  const Text("Upload Image"),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: _image == null
                                    ? const Center(
                                        child: Text("No Image Select"))
                                    : Image.file(_image!),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    imagePickerMethod();
                                  },
                                  child: Text("Select Image")),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_image != null) {
                                      uploadImage();
                                    } else {
                                      showSnackBar("Select Image First",
                                          Duration(milliseconds: 400));
                                    }
                                  },
                                  child: Text("Upload Image")),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
