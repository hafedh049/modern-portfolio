import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/skill.dart';

import 'colors.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: navBarColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            Text(
              "SERVICE",
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Coding like poetry should be short and concise.",
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              clipBehavior: Clip.hardEdge,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: const <Widget>[
                Skill(
                  description: '"Python has been an important part of Google since the beginning,\nand remains so as the system grows and evolves.\nToday dozens of Google engineers use Python,\nand we\'re looking for more people with skills in this language."',
                  icon: FontAwesomeIcons.python,
                  title: "PYTHON",
                ),
                Skill(
                  description: "“Java is C++ without the guns, clubs and knives.”",
                  icon: FontAwesomeIcons.java,
                  title: "JAVA",
                ),
                Skill(
                  description: '“Assembly, while extremely powerful, is simply too difficult\nto program large applications and hard to read or interpret in a logical way\nC is a compiled language, which creates fast and efficient executable files.\nIt is also a small "what you see is all you get" language:”',
                  icon: FontAwesomeIcons.c,
                  title: "C",
                ),
                Skill(
                  description: '“With a consistent language, well-crafted standard libraries,\nand cleaner DOM, Dart is a good choice even for programmers\nwith limited or no JavaScript experience. Things work the way C, C#,\nActionScript, and Java developers expect.”',
                  icon: FontAwesomeIcons.dragon,
                  title: "Flutter",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
