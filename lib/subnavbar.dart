import 'package:flutter/material.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';
import 'package:professional_dark_personal_portfolio/link.dart';

class SubNavBar extends StatelessWidget {
  const SubNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      key: subnavbarkey,
      builder: (BuildContext context, void Function(void Function()) _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (Map<String, dynamic> link in links)
              Link(
                selected: link["hover"],
                func: () {
                  link["func"](context);
                },
                link: link["link"],
              ),
          ],
        );
      },
    );
  }
}
