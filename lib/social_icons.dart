import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';

class SocialIcons extends StatefulWidget {
  const SocialIcons({super.key, required this.icon, required this.func});
  final IconData icon;
  final void Function() func;

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: transparent,
        onHover: (bool value) => setState(() {
          hover = value;
        }),
        onTap: widget.func,
        child: AnimatedContainer(
          duration: 1.seconds,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(hover ? 25 : 5),
            color: backgroundColor,
          ),
          child: Icon(
            widget.icon,
            color: textColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}
