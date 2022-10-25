import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iltgo/pages/faq.dart';
import '../homepage/n_r_license.dart';
import '../homepage/new_license_data.dart';
import '../homepage/nonproenglish.dart';
import '../homepage/nonprotagalog.dart';
import '../homepage/trafficsignreviewer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../homepage/trivia.dart';
import '../authentication/login_page.dart';
import '../authentication/user_class.dart';
import '../colors/textcolor.dart';
import '../homepage/proreviewer.dart';
import 'about.dart';

class HomePagesone extends StatefulWidget {
  const HomePagesone({Key? key}) : super(key: key);

  @override
  State<HomePagesone> createState() => _HomePagesoneState();
}

class _HomePagesoneState extends State<HomePagesone> {
  final style = const TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
  final style2 = const TextStyle(fontSize: 23, fontWeight: FontWeight.bold);
  final menustyle = const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
  final menustyle1 = const TextStyle(fontSize: 8, fontWeight: FontWeight.w500);
  final menustyle2 = const TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
  bool _isVisible = true;
  int duration = 0;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  final double coverHeight = 280;
  final double profileHeight = 144;

  User? user = FirebaseAuth.instance.currentUser;
  UserClass loggedInUser = UserClass();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserClass.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                Visibility(
                  visible: _isVisible,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: greeting(),
                          style: GoogleFonts.nunitoSans(
                              textStyle: style, color: ColorText.secondary),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: Popup(
                    menuList: [
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            CupertinoIcons.person,
                          ),
                          title: InkWell(
                            onTap: () {},
                            child: Text(
                                "${loggedInUser.firstName} ${loggedInUser.lastName}",
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.info,
                          ),
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const About()));
                            },
                            child: const Text("About"),
                          ),
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout,
                          ),
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Logout"),
                          ),
                        ),
                      ),
                    ],
                    icon: const CircleAvatar(
                      backgroundImage: AssetImage('img/default.png'),
                      radius: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
                height: 120,
                child: Image.asset(
                  "assets/iLTGoLogo.png",
                  fit: BoxFit.contain,
                )),
          ),
          SizedBox(
            width: 50,
            height: 10,
          ),
          Center(
            child: AutoSizeText(
              "Land Transportation Guide and Reviewer",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                textStyle: style,
                color: ColorText.secondary,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: ColorText.startColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  )
                ]),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: ColorText.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: AutoSizeText(
                        "Frequently Asked Questions",
                        style: GoogleFonts.prompt(
                            textStyle: menustyle1, color: ColorText.secondary),
                        maxLines: 1,
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("img/lto.png"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FAQ()));
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      trailing: const Icon(Icons.navigate_next_rounded,
                          size: 35, color: ColorText.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorText.startColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  )
                ]),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: ColorText.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: AutoSizeText(
                        "Did you know?",
                        style: GoogleFonts.prompt(
                            textStyle: menustyle1, color: ColorText.secondary),
                        maxLines: 1,
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("img/trivias.png"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TriviaPages()));
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      trailing: const Icon(Icons.navigate_next_rounded,
                          size: 35, color: ColorText.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorText.startColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  )
                ]),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: ColorText.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: AutoSizeText(
                        "New / Renewal Driving License Requirements",
                        style: GoogleFonts.prompt(
                          textStyle: menustyle1,
                          color: ColorText.secondary,
                        ),
                        maxLines: 1,
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("img/license.png"),
                      ),
                      onTap: () {
                        showAnimatedDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: ColorText.primary,
                              content: setupAlertDialoadContainer(),
                            );
                          },
                          animationType: DialogTransitionType.fadeScale,
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      trailing: const Icon(Icons.navigate_next_rounded,
                          size: 35, color: ColorText.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: ColorText.startColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  )
                ]),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: ColorText.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: AutoSizeText(
                        "Traffic Sign Reviewer",
                        style: GoogleFonts.prompt(
                          textStyle: menustyle1,
                          color: ColorText.secondary,
                        ),
                        maxLines: 1,
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("img/trafficsigns.png"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPageView()));
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      trailing: const Icon(Icons.navigate_next_rounded,
                          size: 35, color: ColorText.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorText.startColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  )
                ]),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: ColorText.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: AutoSizeText(
                        "Non Professional Drivers License Reviewer",
                        style: GoogleFonts.prompt(
                          textStyle: menustyle,
                          color: ColorText.secondary,
                        ),
                        maxLines: 1,
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("img/motor.png"),
                      ),
                      onTap: () {
                        showAnimatedDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: ColorText.primary,
                            actions: [
                              Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                color: ColorText.accent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          "Non Professional Drivers License Reviewer (Tagalog)",
                                          style: GoogleFonts.prompt(
                                            textStyle: menustyle2,
                                            color: ColorText.secondary,
                                          ),
                                        ),
                                        leading: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset("img/nonpro1.png"),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NonProTagalog()));
                                          setState(() {
                                            _isVisible = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                color: ColorText.accent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          "Non Professional Drivers License Reviewer (English)",
                                          style: GoogleFonts.prompt(
                                              textStyle: menustyle2,
                                              color: ColorText.secondary),
                                        ),
                                        leading: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset("img/nonpro2.png"),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NonProEnglish()));
                                          setState(() {
                                            _isVisible = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          animationType: DialogTransitionType.fadeScale,
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      trailing: const Icon(Icons.navigate_next_rounded,
                          size: 35, color: ColorText.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: ColorText.startColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  )
                ]),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: ColorText.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: AutoSizeText(
                        "Professional Drivers License Reviewer",
                        style: GoogleFonts.prompt(
                            textStyle: menustyle, color: ColorText.secondary),
                        maxLines: 1,
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("img/car.png"),
                      ),
                      onTap: () {
                        showAnimatedDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: ColorText.primary,
                            actions: [
                              Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                color: ColorText.accent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          "Professional Drivers License Reviewer (Tagalog)",
                                          style: GoogleFonts.prompt(
                                              textStyle: menustyle2,
                                              color: ColorText.secondary),
                                        ),
                                        leading: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset("img/pro1.png"),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProReviewer()));
                                          setState(() {
                                            _isVisible = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          animationType: DialogTransitionType.fadeScale,
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      trailing: const Icon(Icons.navigate_next_rounded,
                          size: 35, color: ColorText.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //log out
  void logout(BuildContext context) {
    Navigator.of(context).pop();
  }

  //Alert Dialog for New/Renewal Driving License
  Widget setupAlertDialoadContainer() {
    return SizedBox(
      height: 400.0,
      width: 270.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: licenses.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            color: ColorText.accent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text(
                      licenses[index].title,
                      style: GoogleFonts.prompt(
                        textStyle: menustyle2,
                        color: ColorText.secondary,
                      ),
                    ),
                    leading: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(licenses[index].image),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NRLicense(licenses[index])));
                      setState(() {
                        _isVisible = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Popup extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const Popup({Key? key, required this.menuList, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      itemBuilder: ((context) => menuList),
      icon: icon,
      constraints: const BoxConstraints.expand(width: 200, height: 200),
    );
  }
}
