import 'package:flutter/material.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';
import 'package:professional_dark_personal_portfolio/finger.dart';
import 'package:professional_dark_personal_portfolio/navbar.dart';

class Start extends StatelessWidget {
  const Start({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://scontent.ftun15-1.fna.fbcdn.net/v/t39.30808-6/330923022_918036919204272_9156578876787908001_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=Klj7UR7urcUAX8X265J&_nc_ht=scontent.ftun15-1.fna&oh=00_AfCY8d3FN63epB0edaowR2Jc_3k3z6AGDCzqi3SF0GxQyg&oe=63EE0273",
                    ),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView(
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                addSemanticIndexes: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                controller: pagesScrollController,
                children: pages,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              NavBar(widget: widget),
              const Spacer(),
              const Align(
                alignment: Alignment(1, 1),
                child: Finger(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
