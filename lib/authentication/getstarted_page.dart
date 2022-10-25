import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../colors/textcolor.dart';

class NonProPagess extends StatefulWidget {
  const NonProPagess({Key? key}) : super(key: key);

  @override
  State<NonProPagess> createState() => _NonProPagessState();
}

class _NonProPagessState extends State<NonProPagess> {
  void main() async {
    //Initializing Database when starting the application.
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorText.maintextColor,
      appBar: AppBar(
        title: const Text("Non Professional Exams"),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('triviass').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final documents = snapshot.data!.docs..shuffle();
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: ColorText.buttonBackground,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Container(),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: snapshot.data!.docs[index]['field1'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: '\n '),
                                  TextSpan(
                                    text: snapshot.data!.docs[index]['field2'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: '\n'),
                                  TextSpan(
                                    text: snapshot.data!.docs[index]['field3'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
