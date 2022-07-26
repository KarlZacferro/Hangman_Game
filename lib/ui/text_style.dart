import 'package:flutter/material.dart';

MaterialApp letterStyle(double size, [Color? color, FontWeight? fw]) {
  return MaterialApp(
    title: 'Custom Fonts',
    theme: ThemeData(fontFamily: 'Raleway'),
  );
}
