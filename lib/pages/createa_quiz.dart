import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';

import '../model/ProDatabase.dart';
import '../model/pro_add_question.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  late String quizImageUrl, quizTitle, quizDescription, quizId;
  ProDatabaseService databaseService = ProDatabaseService();

  bool _isLoading = false;
  createProQuiz() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgUrl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription
      };
      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProAddQuestion(quizId)));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: _isLoading
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Image Url" : null,
                      decoration: const InputDecoration(
                        hintText: 'Quiz Image Url',
                      ),
                      onChanged: (val) {
                        quizImageUrl = val;
                      },
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Quiz Title" : null,
                      decoration: const InputDecoration(
                        hintText: 'Quiz Quiz Title',
                      ),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Description" : null,
                      decoration: const InputDecoration(
                        hintText: 'Quiz Description',
                      ),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createProQuiz();
                        },
                        child:
                            blueButton(context: context, label: "Create Quiz")),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }
}

Widget blueButton({
  required BuildContext context,
  required String label,
  buttonWidth,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
