import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iltgo/colors/textcolor.dart';
import 'package:iltgo/pages/createa_quiz.dart';
import 'package:lottie/lottie.dart';

import '../model/ProDatabase.dart';
import '../model/proquiz.dart';
import '../model/quiz_model.dart';

class ShowResult extends StatelessWidget {
  final int correct, incorrect, total;
  final String quizId;
  ShowResult(
      {required this.correct,
      required this.incorrect,
      required this.total,
      required this.quizId});

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorText.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorText.accent,
        ),
      ),
      body: showWidget(context),
    );
  }

  showWidget(BuildContext context) {
    if (correct <= 20) {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            child: Column(
              children: [
                LottieBuilder.asset('assets/animassets/35271-try-again.json'),
                SizedBox(height: 8),
                Text('Failed! Try Again',
                    style: GoogleFonts.prompt(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                Text('Result Score: $correct / $total',
                    style: GoogleFonts.prompt(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                AutoSizeText(
                  'You answered $correct answers correctly and $incorrect answers incorrectly',
                  style: GoogleFonts.prompt(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: ColorText.secondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    } else if (correct <= 30) {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            child: Column(
              children: [
                LottieBuilder.asset('assets/animassets/112859-congrats.json'),
                Text('You are Good!',
                    style: GoogleFonts.prompt(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                Text('Result Score: $correct / $total',
                    style: GoogleFonts.prompt(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                AutoSizeText(
                  'You answered $correct answers correctly and $incorrect answers incorrectly',
                  style: GoogleFonts.prompt(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: ColorText.secondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    } else if (correct <= 40) {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            child: Column(
              children: [
                LottieBuilder.asset(
                    'assets/animassets/59344-congratulation-badge-animation.json'),
                Text('You are Great!',
                    style: GoogleFonts.prompt(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                Text('Result Score: $correct / $total',
                    style: GoogleFonts.prompt(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                AutoSizeText(
                  'You answered $correct answers correctly and $incorrect answers incorrectly',
                  style: GoogleFonts.prompt(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: ColorText.secondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            child: Column(
              children: [
                LottieBuilder.asset(
                    'assets/animassets/59344-congratulation-badge-animation.json'),
                Text('You are Awesome!',
                    style: GoogleFonts.prompt(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                Text('Result Score: $correct / $total',
                    style: GoogleFonts.prompt(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: ColorText.secondary),
                    textAlign: TextAlign.center),
                AutoSizeText(
                  'You answered $correct answers correctly and $incorrect answers incorrectly',
                  style: GoogleFonts.prompt(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: ColorText.secondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
