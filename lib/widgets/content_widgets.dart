import 'package:flutter/material.dart';
import 'package:flutter_sample_app/config/size_config.dart';

Widget getText(String text, {double size = 1, Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: getFontSize(size),
      color: color,
    ),
  );
}
