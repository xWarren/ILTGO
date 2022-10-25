import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/textcolor.dart';
import '../model/ProDatabase.dart';
import '../model/proquiz.dart';
import 'createa_quiz.dart';

class ExamPages extends StatefulWidget {
  const ExamPages({Key? key}) : super(key: key);

  @override
  State<ExamPages> createState() => _ExamPagesState();
}

class _ExamPagesState extends State<ExamPages> {
  Query quizStream = FirebaseFirestore.instance.collection("proQuiz");
  ProDatabaseService databaseService = ProDatabaseService();
  Widget quizList() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: StreamBuilder<QuerySnapshot>(
            stream: quizStream.snapshots(),
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 600.0,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return QuizTile(
                                      imgUrl: snapshot.data!.docs[index]
                                          ['quizImgUrl'],
                                      desc: snapshot.data!.docs[index]
                                          ['quizDescription'],
                                      title: snapshot.data!.docs[index]
                                          ['quizTitle'],
                                      quizId: snapshot.data!.docs[index]
                                          ['quizId'],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
            }));
  }

  @override
  void initState() {
    databaseService.getQuizData().then((val) {
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorText.primary,
      body: quizList(),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String quizId;
  QuizTile(
      {required this.imgUrl,
      required this.title,
      required this.desc,
      required this.quizId});
  @override
  Widget build(BuildContext context) {
    final menustyle2 =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProQuiz(quizId)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Container(
          color: ColorText.accent,
          margin: const EdgeInsets.only(bottom: 8),
          height: 150,
          child: Stack(
            children: [
              Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width - 48,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AutoSizeText(
                        title,
                        style: GoogleFonts.prompt(
                            textStyle: menustyle2, color: ColorText.secondary),
                        maxLines: 1,
                      ),
                    ),
                    AutoSizeText(
                      desc,
                      style: GoogleFonts.prompt(
                          textStyle: menustyle2, color: ColorText.secondary),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
