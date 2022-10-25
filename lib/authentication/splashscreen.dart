import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../colors/textcolor.dart';
import '../pages/main_pages.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: const MainPages(),
      image: Image.asset('assets/iLTGoLogo.png'),
      backgroundColor: ColorText.primary,
      photoSize: 120,
      loaderColor: Colors.green,
    );
  }
}
