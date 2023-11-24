import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://scontent.ftun15-1.fna.fbcdn.net/v/t39.30808-6/330923022_918036919204272_9156578876787908001_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=Klj7UR7urcUAX8X265J&_nc_ht=scontent.ftun15-1.fna&oh=00_AfCY8d3FN63epB0edaowR2Jc_3k3z6AGDCzqi3SF0GxQyg&oe=63EE0273",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            error,
            style: GoogleFonts.shadowsIntoLight(
              fontSize: 35,
              color: blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
