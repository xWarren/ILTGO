import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import '../colors/textcolor.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  File? imageFile;
  File? _img;
  String result = '';
  ImagePicker? imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
    print(output);
  }

  doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
        path: _img!.path,   // required
        imageMean: 0.0,   // defaults to 117.0
        imageStd: 255.0,  // defaults to 1.0
        numResults: 1,    // defaults to 5
        threshold: 0.2,   // defaults to 0.1
        asynch: true);      // defaults to true
    print(recognitions!.length.toString());
    setState(() {
      result = "";
    });
    recognitions.forEach((element) {
      setState(() {
        print(element.toString());
        result += element["label"] + " " +(element["confidence"] as double).toStringAsFixed(2) + "\n";
      });
    });
  }

  selectPhoto() async {
    PickedFile? pickedFile =
        (await imagePicker?.getImage(source: ImageSource.gallery))!;
    _img = File(pickedFile.path);
    setState(() {
      _img;
      doImageClassification();
    });
  }

  capturePhoto() async {
    PickedFile? pickedFile =
        (await imagePicker?.getImage(source: ImageSource.camera))!;
    _img = File(pickedFile.path);
    setState(() {
      _img;
      doImageClassification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorText.primary,
        body: Column(
          children: [
            const SizedBox(width: 100),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: TextButton(
                      onPressed: selectPhoto,
                      onLongPress: capturePhoto,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 30, right: 35, left: 18),
                        child: _img != null
                            ? Image.file(
                                _img!,
                                height: 270,
                                width: 300,
                              )
                            : SizedBox(
                                width: 240,
                                height: 390,
                                child: Icon(
                                  Icons.camera_alt
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 160),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
