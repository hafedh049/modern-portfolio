import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';
import 'package:professional_dark_personal_portfolio/flamingo_title.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.widget});
  final Widget widget;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int visitors = 0;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("gunichi_hafedh")
        .doc("3z8NW4oW8NG8qC5Yojor")
        .get()
        .then(
          (DocumentSnapshot<Map<String, dynamic>> value) => visitors = value.get("visitors"),
        )
        .then((void value) async {
      await FirebaseFirestore.instance.collection("gunichi_hafedh").doc("3z8NW4oW8NG8qC5Yojor").update(
        {
          "visitors": visitors + 1,
        },
      );
    });
    pagesScrollController.addListener(() {
      if (pagesScrollController.offset <= MediaQuery.of(context).size.height * 1) {
        subnavbarkey.currentState!.setState(() {
          links = links.map((Map<String, dynamic> element) {
            element["hover"] = "HOME" == element["link"] ? true : false;
            return element;
          }).toList();
        });
      } else if (pagesScrollController.offset > MediaQuery.of(context).size.height * 1 && pagesScrollController.offset <= MediaQuery.of(context).size.height * 2) {
        subnavbarkey.currentState!.setState(() {
          links = links.map((Map<String, dynamic> element) {
            element["hover"] = "ABOUT ME" == element["link"] ? true : false;
            return element;
          }).toList();
        });
      } else if (pagesScrollController.offset > MediaQuery.of(context).size.height * 2 && pagesScrollController.offset <= MediaQuery.of(context).size.height * 3) {
        subnavbarkey.currentState!.setState(() {
          links = links.map((Map<String, dynamic> element) {
            element["hover"] = "PORTFOLIO" == element["link"] ? true : false;
            return element;
          }).toList();
        });
      } else if (pagesScrollController.offset > MediaQuery.of(context).size.height * 3 && pagesScrollController.offset <= MediaQuery.of(context).size.height * 4 - 10) {
        subnavbarkey.currentState!.setState(() {
          links = links.map((Map<String, dynamic> element) {
            element["hover"] = "SERVICES" == element["link"] ? true : false;
            return element;
          }).toList();
        });
      } else {
        subnavbarkey.currentState!.setState(() {
          links = links.map((Map<String, dynamic> element) {
            element["hover"] = "CONTACT" == element["link"] ? true : false;
            return element;
          }).toList();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: navBarColor,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          const Spacer(),
          const FlamingoTitle(),
          const Spacer(),
          widget.widget,
          const Spacer(),
        ],
      ),
    );
  }
}
