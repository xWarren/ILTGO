import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/textcolor.dart';
import 'new_license_data.dart';

class NRLicense extends StatelessWidget {
  final menustyle = const TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
  final License licenses;
  NRLicense(this.licenses);
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorText.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: ColorText.accent,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Container(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(licenses.image),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    licenses.title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    licenses.description,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.prompt(
                        textStyle: menustyle, color: ColorText.secondary),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
