import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/link.dart';
import 'package:professional_dark_personal_portfolio/subnavbar.dart';

import 'constants.dart';

class ResponsiveMenu extends StatefulWidget {
  const ResponsiveMenu({super.key, required this.state});
  final int state;

  @override
  State<ResponsiveMenu> createState() => _ResponsiveMenuState();
}

class _ResponsiveMenuState extends State<ResponsiveMenu> {
  bool hover = false;
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return widget.state == 1
        ? const SubNavBar()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              splashColor: transparent,
              highlightColor: transparent,
              hoverColor: transparent,
              focusColor: transparent,
              onHover: (bool value) {
                setState(() {
                  hover = value;
                });
              },
              onTap: () {
                setState(() {
                  clicked = true;
                });
                showModalBottomSheet(
                  backgroundColor: transparent,
                  enableDrag: false,
                  elevation: 8,
                  useSafeArea: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      child: StatefulBuilder(
                        key: subnavbarkey,
                        builder: (BuildContext context, void Function(void Function()) _) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (Map<String, dynamic> link in links)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Link(
                                    selected: link["hover"],
                                    func: () {
                                      link["func"](context);
                                    },
                                    link: link["link"],
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ).then((void value) {
                  setState(() {
                    clicked = false;
                  });
                });
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: progressbarColor,
                  borderRadius: BorderRadius.circular(
                    hover ? 25 : 10,
                  ),
                ),
                width: 50,
                height: 50,
                duration: 500.ms,
                child: Center(
                  child: Icon(
                    clicked ? FontAwesomeIcons.ellipsisVertical : FontAwesomeIcons.ellipsis,
                    color: textColor,
                    size: 15,
                  ),
                ),
              ),
            ),
          );
  }
}
