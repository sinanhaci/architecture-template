import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace!;
  }

  ColorSchemeLight._init();


  final Color background= const Color(0xFFFFFFFF);
  final Color onBackground= const Color(0xFFF9F9F9);
  final Color primary= const Color(0xFF222222);
  final Color secondary= const Color(0xFF455a64);
  final Color error= const Color(0xFFBF0000);
  final Color inversePrimary= const Color(0xFFA9A9A9);







  



}