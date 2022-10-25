import 'package:flutter/material.dart';
import '../pages/createa_quiz.dart';
import 'ProDatabase.dart';

class ProAddQuestion extends StatefulWidget {
  final String quizId;
  const ProAddQuestion(this.quizId);

  @override
  State<ProAddQuestion> createState() => _ProAddQuestionState();
}

class _ProAddQuestionState extends State<ProAddQuestion> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3;
  bool _isLoading = false;

  ProDatabaseService databaseService = ProDatabaseService();
  uploadProQuestion() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3
      };
      await databaseService
          .addQuestionData(questionMap, widget.quizId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'welcome',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Question" : null,
                      decoration: const InputDecoration(
                        hintText: 'Question',
                      ),
                      onChanged: (val) {
                        question = val;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option 1" : null,
                      decoration: const InputDecoration(
                        hintText: 'Option 1',
                      ),
                      onChanged: (val) {
                        option1 = val;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option 2" : null,
                      decoration: const InputDecoration(
                        hintText: 'Option 2',
                      ),
                      onChanged: (val) {
                        option2 = val;
                      },
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option 3" : null,
                      decoration: const InputDecoration(
                        hintText: 'Option 3',
                      ),
                      onChanged: (val) {
                        option3 = val;
                      },
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: blueButton(
                              context: context,
                              label: "Submit",
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2 - 36),
                        ),
                        SizedBox(width: 24),
                        GestureDetector(
                          onTap: () {
                            uploadProQuestion();
                          },
                          child: blueButton(
                              context: context,
                              label: "Add Question",
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2 - 36),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
