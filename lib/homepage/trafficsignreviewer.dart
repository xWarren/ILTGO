import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iltgo/homepage/trafficsign_data.dart';
import '../colors/textcolor.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final menustyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  final menustyle1 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  final menustyle2 = const TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
  late final bool _noItem = false;
  final List<Color> circleColors = [ColorText.primary];
  Color randomGenerator() {
    return circleColors[Random().nextInt(1)];
  }

  int _count = 1;
  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    contents.shuffle();
    super.dispose();
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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: AutoSizeText(
              '$_count out of ${contents.length} Reviewer',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  textStyle: menustyle, color: ColorText.secondary),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 100, bottom: 100, left: 10, right: 10),
            width: 400,
            height: 550,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                      itemCount: contents.length,
                      controller: _controller,
                      // NeverScrollableScrollPhysics disables PageView built-in gestures.
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (_count == contents.length) {
                          Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: randomGenerator(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  contents[index].image,
                                ),
                              ),
                              const Text(' '),
                              AutoSizeText(
                                contents[index].title,
                                style: GoogleFonts.prompt(
                                    textStyle: menustyle1,
                                    color: ColorText.secondary),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 250,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _count != 1
                    ? FloatingActionButton.extended(
                        heroTag: "btn1",
                        onPressed: () {
                          _controller.previousPage(
                              duration: _kDuration, curve: _kCurve);
                          _decrementCount();
                        },
                        label: Text(
                          'Previous',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.prompt(
                              textStyle: menustyle2,
                              color: ColorText.secondary),
                        ),
                        backgroundColor: ColorText.accent,
                      )
                    : Container(),
                _count != 20
                    ? FloatingActionButton.extended(
                        heroTag: "btn2",
                        onPressed: () {
                          _controller.nextPage(
                              duration: _kDuration, curve: _kCurve);
                          _incrementCount();
                        },
                        label: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.prompt(
                              textStyle: menustyle2,
                              color: ColorText.secondary),
                        ),
                        backgroundColor: ColorText.accent,
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
