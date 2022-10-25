import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/textcolor.dart';
import '../homepage/faq_data.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: faqinfos.length,
          itemBuilder: (context, int index) => Container(
            margin: const EdgeInsets.all(8),
            height: 400,
            decoration: BoxDecoration(
              color: ColorText.accent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '${faqinfos[index].question}',
                    style: GoogleFonts.prompt(
                        fontSize: 25, color: ColorText.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${faqinfos[index].answer}',
                    style: GoogleFonts.prompt(
                        fontSize: 15, color: ColorText.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
