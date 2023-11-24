// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cvDownloads = 0;
  @override
  void initState() {
    FirebaseFirestore.instance.collection("gunichi_hafedh").doc("3z8NW4oW8NG8qC5Yojor").get().then(
          (DocumentSnapshot<Map<String, dynamic>> value) => cvDownloads = value.get("cv_downloaders"),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),
                Text(
                  "Hi, I'm",
                  style: GoogleFonts.shadowsIntoLight(
                    fontSize: 50,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Hafedh Gunichi",
                  style: GoogleFonts.shadowsIntoLight(
                    fontSize: 50,
                    color: blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '“Any fool can write code that a computer can understand. Good programmers write code that humans can understand.” ',
                      textStyle: GoogleFonts.shadowsIntoLight(
                        fontSize: 24,
                        color: green,
                      ),
                      speed: const Duration(milliseconds: 50),
                      cursor: " |",
                    ),
                  ],
                  repeatForever: true,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AnimatedButton(
                      text: "RESUME",
                      onPress: () async {
                        await FirebaseFirestore.instance.collection("gunichi_hafedh").doc("3z8NW4oW8NG8qC5Yojor").update(
                          {
                            "cv_downloaders": cvDownloads + 1,
                          },
                        ).then((void value) {
                          cvDownloads++;
                          AnchorElement anchor = AnchorElement();
                          anchor.href = "https://firebasestorage.googleapis.com/v0/b/gunichihafedh-8031d.appspot.com/o/CV-%20GUNICHI%20Hafedh.pdf?alt=media&token=5fee113c-93fc-4d3d-9597-206a4c1bb8b0";
                          anchor.download = 'hafedh_gunichi.pdf';
                          anchor.click();
                          showToast("Resume downloaded.");
                        });
                      },
                      animatedOn: AnimatedOn.onHover,
                      backgroundColor: backgroundColor,
                      transitionType: TransitionType.RIGHT_TO_LEFT,
                      isReverse: true,
                      textStyle: GoogleFonts.abel(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
                      animationDuration: 1.seconds,
                      selectedBackgroundColor: textColor,
                      selectedTextColor: backgroundColor,
                      width: 100,
                      height: 40,
                    ),
                    const SizedBox(width: 20),
                    AnimatedButton(
                      text: "HIRE",
                      onPress: () {},
                      animatedOn: AnimatedOn.onHover,
                      backgroundColor: backgroundColor,
                      transitionType: TransitionType.RIGHT_TO_LEFT,
                      isReverse: true,
                      textStyle: GoogleFonts.abel(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
                      animationDuration: 1.seconds,
                      selectedBackgroundColor: textColor,
                      selectedTextColor: backgroundColor,
                      width: 100,
                      height: 40,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 2,
                  color: blue,
                )
                    .animate(
                      onComplete: (AnimationController controller) => controller.repeat(),
                    )
                    .scale(
                      begin: const Offset(-1, -1),
                      end: const Offset(1, 1),
                      duration: 5.seconds,
                    ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
