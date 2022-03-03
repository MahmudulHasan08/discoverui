import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigTextApp extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  BigTextApp({this.size = 30, this.color = Colors.black, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
