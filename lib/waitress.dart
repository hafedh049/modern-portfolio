import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/logo.dart';

class Waitress extends StatelessWidget {
  const Waitress({super.key, this.value = .5});
  final double value;

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
          child: LiquidCustomProgressIndicator(
            backgroundColor: transparent, value: value, // Defaults to 0.5.
            valueColor: AlwaysStoppedAnimation(blue.withOpacity(.7)),
            direction: Axis.vertical,
            shapePath: drawPath(),
            center: Image.network(
              "https://scontent.ftun15-1.fna.fbcdn.net/v/t39.30808-6/330962608_1367764417314902_5807699794562654187_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=0debeb&_nc_ohc=f0J6M7VPrNcAX9j-Sen&_nc_ht=scontent.ftun15-1.fna&oh=00_AfCjLkAkQAlDFM5RJmyGoxZNS_63nJ9uFcs57bQ3KJtAUA&oe=63ED9407",
              color: blue.withOpacity(.5),
              height: 400,
              width: 400,
            ),
          ),
        ),
      ),
    );
  }
}
