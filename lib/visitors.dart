import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';

class Visitors extends StatelessWidget {
  const Visitors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("gunichi_hafedh").doc("3z8NW4oW8NG8qC5Yojor").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                return Countup(
                  begin: 0,
                  curve: Curves.linear,
                  duration: 2.seconds,
                  softWrap: true,
                  separator: " ",
                  end: snapshot.hasData ? snapshot.data!.get("visitors").toDouble() : 0,
                  style: GoogleFonts.actor(
                    color: textColor,
                    fontSize: MediaQuery.of(context).size.width * .1,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
          const SizedBox(height: 20),
          Text(
            "VISITORS",
            style: GoogleFonts.actor(
              color: textColor,
              fontSize: MediaQuery.of(context).size.width * .1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
