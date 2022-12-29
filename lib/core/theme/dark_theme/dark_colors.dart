import 'package:flutter/material.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instace;
  static ColorSchemeDark get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace!;
  }

  ColorSchemeDark._init();


  final Color background= const Color(0xFF282E3A);
  final Color onBackground= const Color(0xFF455a64);
  final Color primary= const Color(0xFFFFFFFF);
  final Color secondary= const Color(0xFFF9F9F9);
  final Color error= const Color(0xFFBF0000);
  final Color inversePrimary= const Color(0xFFA9A9A9);






}