import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'colors.dart';

class Competence extends StatefulWidget {
  const Competence({super.key, required this.skill, required this.percentage});
  final String skill;
  final double percentage;

  @override
  State<Competence> createState() => _CompetenceState();
}

class _CompetenceState extends State<Competence> {
  late ValueNotifier<double> notifier;
  @override
  void initState() {
    notifier = ValueNotifier(widget.percentage);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SimpleCircularProgressBar(
            size: 200,
            animationDuration: 6,
            backColor: navBarColor,
            fullProgressColor: blue,
            valueNotifier: notifier,
            //maxValue: widget.percentage,
            //mergeMode: true,
            onGetText: (double value) {
              return Text(
                "${value.toInt().toString()} %",
                style: GoogleFonts.actor(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
            progressColors: <Color>[blue, purple],
            startAngle: 0,
            progressStrokeWidth: 5,
          ),
          const SizedBox(height: 20),
          Text(
            widget.skill,
            style: GoogleFonts.actor(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
