import 'dart:ui';
import 'package:flutter/material.dart';

class Content {
  final String title;
  final String image;
  final Color color;
  Content(this.title, this.image, this.color);
}

List<Content> contents = [
  Content(
      'Warning U-Turn', 'trafficsignsimg/warninguturn.png', Color(0xff2e0249)),
  Content('Traffic Light Ahead', 'trafficsignsimg/trafficlight.png',
      Color(0xffa91079)),
  Content('Warning for a narrowing', 'trafficsignsimg/narrowing.png',
      Color(0xff570a57)),
  Content('Give way to all traffic', 'trafficsignsimg/giveway.png',
      Color(0xff308b3b)),
  Content('Warning for curves', 'trafficsignsimg/warningforcurves.png',
      Color(0xff43348d)),
  Content('Stop and give way to all traffic', 'trafficsignsimg/stop.png',
      Color(0xff865227)),
  Content('Slippery road surface ahead', 'trafficsignsimg/slippery.png',
      Color(0xff803d2c)),
  Content(
      'Steep descent ahead', 'trafficsignsimg/steep.png', Color(0xffb42b51)),
  Content('Driving faster than indicated compulsory (minimum speed)',
      'trafficsignsimg/40min.png', Color(0xffb42b51)),
  Content('Ahead only', 'trafficsignsimg/ahead.png', Color(0xffb42b51)),
  Content(
      'Roundabaout head', 'trafficsignsimg/roundabout.png', Color(0xffb42b51)),
  Content('Uncontrolled crossroad ahead', 'trafficsignsimg/uncontrolled.png',
      Color(0xffb42b51)),
  Content('Stopping and parking forbidden',
      'trafficsignsimg/stoppingandparking.png', Color(0xff14d4c5)),
  Content('No turning / u-turn allowed', 'trafficsignsimg/nouturn.png',
      Color(0xff14d4c5)),
  Content('Overtaking not allowed', 'trafficsignsimg/overtaking.png',
      Color(0xff14d4c5)),
  Content('No Parking', 'trafficsignsimg/noparking.png', Color(0xff14d4c5)),
  Content('Pedestrians not permitted', 'trafficsignsimg/pedestrians.png',
      Color(0xff14d4c5)),
  Content('Lorries - Trucks forbidden', 'trafficsignsimg/truck.png',
      Color(0xff14d4c5)),
  Content('No Entry (one way traffic)', 'trafficsignsimg/noentry.png',
      Color(0xff14d4c5)),
  Content(
      'Speed Limit Ends', 'trafficsignsimg/speedlimit.png', Color(0xff14d4c5)),
];
final List<Color> circleColors = [
  Color(0xff2e0249),
  Color(0xffa91079),
  Color(0xff570a57),
  Color(0xff308b3b),
  Color(0xff43348d),
  Color(0xff865227),
  Color(0xff803d2c),
  Color(0xffb42b51),
  Color(0xff35806f),
  Color(0xff997237),
];

Image appLogo = new Image(
    image: new ExactAssetImage("img/motor.png"),
    height: 520.0,
    width: 320.0,
    alignment: FractionalOffset.center);
