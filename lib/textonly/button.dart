import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/textcolor.dart';

class AppButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  AppButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorText.buttonBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 55,
          ),
        ],
      ),
    );
  }
}
