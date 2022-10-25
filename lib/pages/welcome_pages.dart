import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors/textcolor.dart';
import '../textonly/button.dart';
import '../textonly/textlarge.dart';
import '../textonly/textsmall.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List texts = [
    "LTO",
    "AI Scanner",
    "Google Map API",
  ];
  List infotext = [
    "The Land Transportation Office is an agency of the Philippinon in the PhilippinesThe Land Transportation Office is an agency of the Philippinon in the Philippines",
    "The Land Transportation Office is an agency of the Philippinon in the PhilippinesThe Land Transportation Office is an agency of the Philippinon in the Philippines",
    "The Land Transportation Office is an agency of the Philippinon in the PhilippinesThe Land Transportation Office is an agency of the Philippinon in the Philippines",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00BCD1),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LargeText(
                            text: texts[index],
                            size: 20,
                            color: ColorText.textColor1,
                          ),
                          SmallText(
                            text: "An Informative Land Transporation Guide",
                            size: 17,
                            color: ColorText.textColor1,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 340,
                            child: SmallText(
                              text: infotext[index],
                              size: 14,
                              color: ColorText.textColor1,
                            ),
                          ),
                          const SizedBox(
                            height: 380,
                          ),
                          AppButton(
                            width: 120,
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexSlider) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 10,
                            height: index == indexSlider ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexSlider
                                    ? ColorText.mainColor
                                    : ColorText.textColor2),
                          );
                        }),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
