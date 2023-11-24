import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';

class Link extends StatefulWidget {
  const Link({super.key, required this.func, required this.link, required this.selected});
  final void Function() func;
  final String link;
  final bool selected;

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        hoverColor: transparent,
        focusColor: transparent,
        highlightColor: transparent,
        onTap: () {
          subnavbarkey.currentState!.setState(() {
            links = links.map((Map<String, dynamic> element) {
              element["hover"] = widget.link == element["link"] ? true : false;
              return element;
            }).toList();

            widget.func();
          });
        },
        onHover: (bool value) => setState(() {
          hover = value;
        }),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Text(
              widget.link,
              style: TextStyle(
                color: widget.selected
                    ? blue
                    : hover
                        ? blue
                        : textColor,
                fontSize: 18,
              ),
            ).animate(target: hover ? 1 : 0).blur(begin: const Offset(0, 0), end: const Offset(1, 1)),
            Container(
              color: navBarColor,
              width: widget.link.length * 2 * 6,
              height: 1,
            )
                .animate(
                  target: widget.selected
                      ? 1
                      : hover
                          ? 1
                          : 0,
                )
                .fade(),
          ],
        ),
      ),
    );
  }
}
