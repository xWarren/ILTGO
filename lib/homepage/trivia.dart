import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/textcolor.dart';
import 'dart:ui' as ui;

bool isSwitched = false;

class TriviaPages extends StatefulWidget {
  const TriviaPages({Key? key}) : super(key: key);

  @override
  State<TriviaPages> createState() => _TriviaPagesState();
}

class _TriviaPagesState extends State<TriviaPages> {
  final menustyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  final List<Color> circleColors = [ColorText.accent];
  Color randomGenerator() {
    return circleColors[Random().nextInt(1)];
  }

  @override
  void main() async {
    //Initializing Database when starting the application.
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  int remainingCapacity(String input, int limit) {
    var length = input.length;
    return limit - length;
  }

  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorText.primary,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Did you know?'),
                background: Image.asset(
                  'img/roadsigns.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              floating: true, // AppBar appears immediately
              snap: true, // AppBar displayed 0% or 100%
              pinned: true, // AppBar pinned to top
            ),
          ],
          body: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('triviass').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs..shuffle();
                  return ListView.builder(
                    itemCount: documents.length - 10,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Container(
                          width: 440,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: randomGenerator(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                documents[index]['field2'],
                                style: GoogleFonts.prompt(
                                    textStyle: menustyle,
                                    color: ColorText.secondary),
                                textAlign: TextAlign.center,
                              ),
                              AutoSizeText(
                                documents[index]['field3'],
                                style: GoogleFonts.prompt(
                                    textStyle: menustyle,
                                    color: ColorText.secondary),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ),
      );
}
