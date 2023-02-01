import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontConfiguration{
  FontConfiguration._();
  static TextStyle get appFont => GoogleFonts.montserrat();
  static double get largeSize => 40;
  static double get mediumSize => 24;
  static double get smallSize => 15;

  static FontWeight get boldFontWeight => FontWeight.w600;
  static FontWeight get normalFontWeight => FontWeight.w400;

  static double? get letterSpacing => null;


}