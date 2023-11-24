import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';

class Finger extends StatefulWidget {
  const Finger({super.key});
  @override
  State<Finger> createState() => _FingerState();
}

class _FingerState extends State<Finger> {
  bool show = false;
  bool hover = false;
  @override
  void initState() {
    pagesScrollController.addListener(() {
      setState(() {
        if (pagesScrollController.offset > 100) {
          show = true;
        } else {
          show = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: transparent,
      highlightColor: transparent,
      focusColor: transparent,
      splashColor: transparent,
      onHover: (bool value) {
        setState(() {
          hover = value;
        });
      },
      onTap: () {
        pagesScrollController.animateTo(MediaQuery.of(context).size.height * 0, duration: 500.milliseconds, curve: Curves.linear);
      },
      child: Visibility(
        visible: show,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: AnimatedContainer(
            duration: 500.ms,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: progressbarColor,
              borderRadius: BorderRadius.circular(hover ? 25 : 15),
            ),
            child: Icon(
              FontAwesomeIcons.handPointUp,
              color: textColor,
              size: 25,
            ),
          ),
        ),
      ),
    )
        .animate(
          onComplete: (AnimationController controller) => controller.repeat(reverse: true),
        )
        .move(
          begin: const Offset(0, 30),
          end: const Offset(0, 50),
          duration: 500.ms,
        );
  }
}
