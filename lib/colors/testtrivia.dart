import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iltgo/HomePage/trivia.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class TestTrivias extends StatelessWidget {
  TextEditingController question = new TextEditingController();
  TextEditingController choice1 = new TextEditingController();
  TextEditingController choice2 = new TextEditingController();
  TextEditingController choice3 = new TextEditingController();
  TextEditingController answer = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserting Trivias'),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: question,
                decoration: InputDecoration(hintText: "Question"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: choice1,
                decoration: InputDecoration(hintText: "Choice 1"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: choice2,
                decoration: InputDecoration(hintText: "Choice 2"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: choice3,
                decoration: InputDecoration(hintText: "Choice 3"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: answer,
                decoration: InputDecoration(hintText: "Answer"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "question": question.text,
                    "choice1": choice1.text,
                    "choice2": choice2.text,
                    "choice3": choice3.text,
                    "answer": answer.text,
                  };
                  FirebaseFirestore.instance.collection("Exam").add(data);
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
