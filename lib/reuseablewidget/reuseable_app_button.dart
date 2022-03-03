import 'package:flutter/material.dart';

import 'app_text.dart';

class ReuseableAppButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color color;
  final IconData? icon;
  double size;
  final String? text;
  bool isIcon;
  ReuseableAppButton(
      {this.text,
      required this.color,
      required this.size,
      this.icon,
      required this.backgroundColor,
      required this.borderColor,
      this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon == false
          ? Center(child: AppText(text: text!, color: color))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
