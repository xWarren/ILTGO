import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iltgo/pages/home_pageone.dart';
import 'package:iltgo/pages/object.dart';
import '../colors/textcolor.dart';
import 'cameras_pages.dart';
import 'exam_pages.dart';
import 'map_splashscreen.dart';

class MainPages extends StatefulWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List pages = [
    HomePagesone(),
    ExamPages(),
    ScannerPage(),
    MapSplash(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorText.primary,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorText.primary,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: ColorText.accent,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.question), label: 'Exam'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.camera), label: 'AI Scanner'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.locationDot), label: 'Map'),
        ],
      ),
    );
  }
}
