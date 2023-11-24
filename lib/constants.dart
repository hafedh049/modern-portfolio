import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:professional_dark_personal_portfolio/about_me.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/contact.dart';
import 'package:professional_dark_personal_portfolio/home.dart';
import 'package:professional_dark_personal_portfolio/my_position.dart';
import 'package:professional_dark_personal_portfolio/portfolio.dart';
import 'package:professional_dark_personal_portfolio/services.dart';
import 'package:professional_dark_personal_portfolio/visitors.dart';

List<Map<String, dynamic>> links = <Map<String, dynamic>>[
  {
    "link": "HOME",
    "func": (BuildContext context) {
      pagesScrollController.animateTo(MediaQuery.of(context).size.height * 0, duration: 500.milliseconds, curve: Curves.linear);
    },
    "hover": true,
  },
  {
    "link": "ABOUT ME",
    "func": (BuildContext context) {
      pagesScrollController.animateTo(MediaQuery.of(context).size.height * 1 + 10, duration: 500.milliseconds, curve: Curves.linear);
    },
    "hover": false,
  },
  {
    "link": "PORTFOLIO",
    "func": (BuildContext context) {
      pagesScrollController.animateTo(MediaQuery.of(context).size.height * 2 + 10, duration: 500.milliseconds, curve: Curves.linear);
    },
    "hover": false,
  },
  {
    "link": "SERVICES",
    "func": (BuildContext context) {
      pagesScrollController.animateTo(MediaQuery.of(context).size.height * 3 + 10, duration: 500.milliseconds, curve: Curves.linear);
    },
    "hover": false,
  },
  {
    "link": "CONTACT",
    "func": (BuildContext context) {
      pagesScrollController.animateTo(MediaQuery.of(context).size.height * 4 + 10, duration: 500.milliseconds, curve: Curves.linear);
    },
    "hover": false,
  },
];

ScrollController pagesScrollController = ScrollController();
GlobalKey subnavbarkey = GlobalKey();

List<Widget> pages = const <Widget>[
  Home(),
  AboutMe(),
  Portfolio(),
  Services(),
  ContactMe(),
  MyPosition(),
  Visitors(),
];

List<Map<String, dynamic>> skills = const <Map<String, dynamic>>[
  {
    "skill": "FLUTTER",
    "value": 96,
  },
  {
    "skill": "PYTHON",
    "value": 96,
  },
  {
    "skill": "ANGULAR",
    "value": 72,
  },
  {
    "skill": "TYPESCRIPT",
    "value": 85,
  },
  {
    "skill": "C",
    "value": 90,
  },
  {
    "skill": "C++",
    "value": 90,
  },
  {
    "skill": "HTML5",
    "value": 81,
  },
  {
    "skill": "CSS3",
    "value": 79,
  },
];

void showToast(String message, {String color = "rgb(0,200,255)"}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: blue,
    fontSize: 20,
    gravity: ToastGravity.BOTTOM_RIGHT,
    textColor: textColor,
    timeInSecForIosWeb: 4,
    toastLength: Toast.LENGTH_LONG,
    webShowClose: true,
    webBgColor: color,
  );
}
