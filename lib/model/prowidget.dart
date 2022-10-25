import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;
  QuestionTile(
      {required this.option,
      required this.description,
      required this.correctAnswer,
      required this.optionSelected});

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 12,
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: widget.optionSelected == widget.description
                        ? widget.correctAnswer == widget.optionSelected
                            ? Colors.green
                            : Colors.red
                        : Colors.black,
                  )),
              child: AutoSizeText(
                widget.description,
                style: GoogleFonts.prompt(
                    color: widget.optionSelected == widget.description
                        ? widget.correctAnswer == widget.optionSelected
                            ? Colors.green
                            : Colors.red
                        : Colors.white,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
