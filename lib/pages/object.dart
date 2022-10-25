import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';

import '../colors/textcolor.dart';
import '../main.dart';

class LiveObject extends StatefulWidget {
  const LiveObject({Key? key}) : super(key: key);

  @override
  State<LiveObject> createState() => _LiveObjectState();
}

class _LiveObjectState extends State<LiveObject> {
  bool isWorking = false;
  String result = "";
  CameraController? cameraController;
  CameraImage? imgCamera;

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController?.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController?.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                  runModelOnStreamFramer(),
                }
            });
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadDataModelFiles();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController?.dispose();
  }

  loadDataModelFiles() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  runModelOnStreamFramer() async {
    var recognitions = await Tflite.runModelOnFrame(
      bytesList:  imgCamera!.planes.map((plane)
      {
        return plane.bytes;
      }).toList(),

      imageHeight: imgCamera!.height,
      imageWidth: imgCamera!.width,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.1,
      asynch: true,
    );

    result = "";

    recognitions?.forEach((response)
    {
      result += response["label"] + " " + (response["confidence"] as double).toStringAsFixed(2) + "\n\n";
    });

    setState(() {
      result;
    });

    isWorking = false;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: ColorText.primary,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    height: 220,
                    width: 320,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        initCamera();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 35),
                        height: 270,
                        width: 360,
                        child: imgCamera == null
                            ? Container(
                                height: 270,
                                width: 360,
                                child: Icon(
                                  Icons.photo_camera_front,
                                  size: 40,
                                ),
                              )
                            : AspectRatio(
                                aspectRatio:
                                    cameraController!.value.aspectRatio,
                                child: CameraPreview(cameraController!),
                              ),
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 55),
                  child: SingleChildScrollView(
                    child: Text(
                      result,
                      style: GoogleFonts.prompt(
                        fontSize: 25.0,
                        color: ColorText.secondary
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
