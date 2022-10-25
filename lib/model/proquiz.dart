import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iltgo/model/prowidget.dart';
import 'package:iltgo/model/quiz_model.dart';
import '../Exam/show_result.dart';
import '../colors/textcolor.dart';
import '../pages/createa_quiz.dart';
import 'ProDatabase.dart';

class ProQuiz extends StatefulWidget {
  final String quizId;
  ProQuiz(this.quizId);

  @override
  State<ProQuiz> createState() => _ProQuizState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _ProQuizState extends State<ProQuiz> {
  ProDatabaseService databaseService = ProDatabaseService();
  QuerySnapshot? questionSnapshot;

  String optionSelected = "";
  QuizModel getQuestionFromDataSnapshot(DocumentSnapshot questionSnapshot) {
    QuizModel quizModel = QuizModel();

    quizModel.question = questionSnapshot["question"];

    List<String> options = [
      questionSnapshot["option1"],
      questionSnapshot["option2"],
      questionSnapshot["option3"],
    ];
    options.shuffle();

    quizModel.option1 = options[0];
    quizModel.option2 = options[1];
    quizModel.option3 = options[2];
    quizModel.correctOption = questionSnapshot['option1'];
    quizModel.answered = false;

    return quizModel;
  }

  @override
  void initState() {
    print("${widget.quizId}");
    databaseService.getQuestionData(widget.quizId).then((value) {
      questionSnapshot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionSnapshot!.docs.length;

      print("$total this is total");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorText.primary,
      appBar: AppBar(
        backgroundColor: ColorText.primary,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorText.accent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            questionSnapshot == null
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: questionSnapshot?.docs.length,
                    itemBuilder: (context, index) {
                      return QuestionPlayTile(
                        quizModel: getQuestionFromDataSnapshot(
                            questionSnapshot!.docs[index]),
                        index: index,
                      );
                    }),
            SizedBox(height: 20),
            GestureDetector(
              child: blueButton(context: context, label: "Show Result"),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowResult(
                        correct: _correct,
                        incorrect: _incorrect,
                        total: total,
                        quizId: 'welcome',
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionPlayTile extends StatefulWidget {
  final QuizModel quizModel;
  ProDatabaseService databaseService = ProDatabaseService();

  final int index;
  QuestionPlayTile({required this.quizModel, required this.index});

  @override
  State<QuestionPlayTile> createState() => _QuestionPlayTileState();
}

class _QuestionPlayTileState extends State<QuestionPlayTile> {
  String optionSelected = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        AutoSizeText(
          "Question ${widget.index + 1}: ${widget.quizModel.question}",
          style: GoogleFonts.prompt(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.quizModel.answered) {
              if (widget.quizModel.option1 == widget.quizModel.correctOption) {
                optionSelected = widget.quizModel.option1;
                widget.quizModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              } else {
                optionSelected = widget.quizModel.option1;
                widget.quizModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: QuestionTile(
              option: "A",
              description: widget.quizModel.option1,
              correctAnswer: widget.quizModel.correctOption,
              optionSelected: optionSelected),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            if (!widget.quizModel.answered) {
              if (widget.quizModel.option2 == widget.quizModel.correctOption) {
                optionSelected = widget.quizModel.option2;
                widget.quizModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              } else {
                optionSelected = widget.quizModel.option2;
                widget.quizModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: QuestionTile(
              option: "B",
              description: widget.quizModel.option2,
              correctAnswer: widget.quizModel.correctOption,
              optionSelected: optionSelected),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            if (!widget.quizModel.answered) {
              if (widget.quizModel.option3 == widget.quizModel.correctOption) {
                optionSelected = widget.quizModel.option3;
                widget.quizModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              } else {
                optionSelected = widget.quizModel.option3;
                widget.quizModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: QuestionTile(
              option: "C",
              description: widget.quizModel.option3,
              correctAnswer: widget.quizModel.correctOption,
              optionSelected: optionSelected),
        ),
      ],
    );
  }
}
