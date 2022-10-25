import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../colors/textcolor.dart';
import '../map_providers/map_pages.dart';

class MapSplash extends StatefulWidget {
  @override
  State<MapSplash> createState() => MapSplashState();
}

class MapSplashState extends State<MapSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ProviderScope(child: MapPages()))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorText.maintextColor,
      body: Center(
        child: Container(
            height: 200.0,
            width: 200.0,
            child:
                LottieBuilder.asset('assets/animassets/13177-location.json')),
      ),
    );
  }
}
