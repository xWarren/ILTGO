import 'package:dartz/dartz.dart';

class TSAQuestion {
  final String image;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  TSAQuestion({
    required this.image,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  TSAQuestion(image: 'trafficsignsimg/warninguturn.png', options: [
    const Option(
        text: 'Driving faster than indicated compulsory (minimum speed)',
        isCorrect: true),
    const Option(text: 'No Overtake', isCorrect: false),
    const Option(text: 'Bike Lane', isCorrect: false),
  ]),
  TSAQuestion(image: 'trafficsignsimg/trafficlight.png', options: [
    const Option(
        text: 'Driving faster than indicated compulsory (minimum speed)',
        isCorrect: true),
    const Option(text: 'No Overtake', isCorrect: false),
    const Option(text: 'Bike Lane', isCorrect: false),
  ]),
  TSAQuestion(image: 'trafficsignsimg/giveway.png', options: [
    const Option(
        text: 'Driving faster than indicated compulsory (minimum speed)',
        isCorrect: true),
    const Option(text: 'No Overtake', isCorrect: false),
    const Option(text: 'Bike Lane', isCorrect: false),
  ]),
  TSAQuestion(image: 'trafficsignsimg/40min.png', options: [
    const Option(
        text: 'Driving faster than indicated compulsory (minimum speed)',
        isCorrect: true),
    const Option(text: 'No Overtake', isCorrect: false),
    const Option(text: 'Bike Lane', isCorrect: false),
  ]),
  TSAQuestion(image: 'trafficsignsimg/slippery.png', options: [
    const Option(text: 'Slippery road surface ahead', isCorrect: true),
    const Option(text: 'No Overtake', isCorrect: false),
    const Option(text: 'Bike Lane', isCorrect: false),
  ]),
];
