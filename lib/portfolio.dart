import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/competence.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  GlobalKey leftKey = GlobalKey();
  GlobalKey rightKey = GlobalKey();
  ScrollController skillScrollController = ScrollController();
  bool left = false;
  bool right = true;

  @override
  void dispose() {
    skillScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    skillScrollController.addListener(() {
      leftKey.currentState!.setState(() {
        if (skillScrollController.offset > 0) {
          left = true;
        } else {
          left = false;
        }
      });
      rightKey.currentState!.setState(() {
        if (skillScrollController.offset < skillScrollController.position.maxScrollExtent) {
          right = true;
        } else {
          right = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: navBarColor),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 60),
            Text(
              "MY SKILLS",
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Excellence is not a skill, it's an attitude.",
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StatefulBuilder(
                  key: leftKey,
                  builder: (BuildContext context, void Function(void Function()) setS) {
                    return GestureDetector(
                      onTap: left
                          ? () {
                              skillScrollController.animateTo(
                                skillScrollController.offset - 100,
                                duration: 200.ms,
                                curve: Curves.linear,
                              );
                            }
                          : null,
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: left ? progressbarColor : progressbarColor.withOpacity(.5),
                        size: 40,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: SingleChildScrollView(
                    controller: skillScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: skills
                          .map(
                            (Map<String, dynamic> skill) => Competence(
                              skill: skill["skill"],
                              percentage: skill["value"],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                StatefulBuilder(
                  key: rightKey,
                  builder: (BuildContext context, void Function(void Function()) setS) {
                    return GestureDetector(
                      onTap: right
                          ? () {
                              skillScrollController.animateTo(
                                skillScrollController.offset + 100,
                                duration: 200.ms,
                                curve: Curves.linear,
                              );
                            }
                          : null,
                      child: Icon(
                        FontAwesomeIcons.chevronRight,
                        color: right ? progressbarColor : progressbarColor.withOpacity(.5),
                        size: 40,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
