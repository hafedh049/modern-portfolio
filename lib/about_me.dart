// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/social_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'constants.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  int cvDownloads = 0;
  @override
  void initState() {
    FirebaseFirestore.instance.collection("gunichi_hafedh").doc("3z8NW4oW8NG8qC5Yojor").get().then(
          (DocumentSnapshot<Map<String, dynamic>> value) => cvDownloads = value.get("cv_downloaders"),
        );
    super.initState();
  }

  bool pictureHovored = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: navBarColor,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            Text(
              "ABOUT ME",
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Clean code always looks like it was written by someone who cares.",
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setSt) {
                        return InkWell(
                          onTap: () {},
                          onHover: (bool value) => setSt(() => pictureHovored = value),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 350,
                                height: 500,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://scontent.ftun15-1.fna.fbcdn.net/v/t39.30808-6/330767796_737327761080364_8929138531349621720_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=0debeb&_nc_ohc=LDG6xHB2NL0AX8DPu8g&_nc_ht=scontent.ftun15-1.fna&oh=00_AfAoH1UvfrGuct16XYOOUA6NSGZyCvNNIwmyiTCPg532vw&oe=63EEAC47"),
                                  ),
                                ),
                              )
                                  .animate(
                                    target: pictureHovored ? 1 : 0,
                                  )
                                  .tint(
                                    color: progressbarColor,
                                    begin: 0,
                                    end: .5,
                                    duration: 1.seconds,
                                  ),
                              Visibility(
                                visible: pictureHovored ? true : false,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SocialIcons(
                                        icon: FontAwesomeIcons.facebook,
                                        func: () async {
                                          await launchUrlString("https://www.facebook.com/sagittarius.aurora.25.12.2020");
                                        }),
                                    SocialIcons(
                                        icon: FontAwesomeIcons.github,
                                        func: () async {
                                          await launchUrlString("https://github.com/hafedh049");
                                        }),
                                    SocialIcons(
                                        icon: FontAwesomeIcons.linkedin,
                                        func: () async {
                                          await launchUrlString("https://www.linkedin.com/in/hafedh-gunichi-a18a60222/");
                                        }),
                                    SocialIcons(
                                        icon: FontAwesomeIcons.hackerrank,
                                        func: () async {
                                          await launchUrlString("https://www.hackerrank.com/hafedh_gunichi");
                                        }),
                                    SocialIcons(
                                        icon: FontAwesomeIcons.youtube,
                                        func: () async {
                                          await launchUrlString("https://www.youtube.com/channel/UCnKjGb1yd1gqeM-2xnnkLRA");
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "HAFEDH GUNICHI",
                      style: GoogleFonts.actor(
                        color: textColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Flutter & Python developer.",
                      style: GoogleFonts.actor(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MediaQuery.of(context).size.width > 720
                        ? SizedBox(
                            width: 300,
                            child: Text(
                              "Hafedh Gunichi is a promising computer science student from Tunisia. At the young age of 21, he is already making waves in the tech industry with his expertise in both Flutter and Python development. Currently, Hafedh is pursuing his degree at ISIMM and this year marks his graduation. With his strong educational foundation and practical experience, he is well-prepared to tackle real-world challenges in the tech industry. His passion for technology and drive to succeed will undoubtedly make him a valuable addition to any team. As he embarks on the next chapter of his career, Hafedh is poised to make a significant impact in the field of technology.",
                              style: GoogleFonts.actor(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(height: MediaQuery.of(context).size.width > 720 ? 20 : 0),
                    AnimatedButton(
                      text: "DOWNLOAD RESUME",
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
                      width: 200,
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
