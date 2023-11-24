import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';

class Skill extends StatefulWidget {
  const Skill({super.key, required this.description, required this.icon, required this.title});
  final String title, description;
  final IconData icon;
  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: InkWell(
        splashColor: transparent,
        onTap: () {},
        onHover: (bool value) {
          setState(() {
            hover = value;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundColor: textColor,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: navBarColor,
                child: Icon(
                  widget.icon,
                  color: textColor,
                  size: 35,
                ),
              ),
            )
                .animate(
                  target: hover ? 1 : 0,
                )
                .rotate(
                  begin: 0,
                  end: 1,
                  duration: 1.seconds,
                ),
            const SizedBox(height: 30),
            Text(
              widget.title,
              style: GoogleFonts.actor(
                color: blue,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.description,
              softWrap: true,
              style: GoogleFonts.actor(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
