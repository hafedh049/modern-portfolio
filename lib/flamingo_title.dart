import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';

class FlamingoTitle extends StatefulWidget {
  const FlamingoTitle({super.key});

  @override
  State<FlamingoTitle> createState() => _FlamingoTitleState();
}

class _FlamingoTitleState extends State<FlamingoTitle> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: transparent,
      onTap: () {
        subnavbarkey.currentState!.setState(() {
          links = links.map((Map<String, dynamic> element) {
            element["hover"] = "HOME" == element["link"] ? true : false;
            return element;
          }).toList();
        });
        pagesScrollController.animateTo(MediaQuery.of(context).size.height * 0, duration: 500.milliseconds, curve: Curves.linear);
      },
      onHover: (bool value) {
        setState(() {
          hover = value;
        });
      },
      child: Text(
        "Flamingo.",
        style: GoogleFonts.shadowsIntoLight(
          color: hover ? blue : textColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      )
          .animate(
            target: hover ? 1 : 0,
            /*  onComplete: (controller) => controller.repeat(),*/
          )
          .shake(duration: 1000.ms),
    );
  }
}
