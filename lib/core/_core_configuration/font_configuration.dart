import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontConfiguration{
  FontConfiguration._();
  static TextStyle get appFont => GoogleFonts.montserrat();
  static double get xLargeSize => 40;
  static double get largeSize => 28;
  static double get mediumSize => 24;
  static double get normalSize => 20;
  static double get smallSize => 16;
  static double get xSmallSize => 12;

  static FontWeight get boldFontWeight => FontWeight.w600;
  static FontWeight get normalFontWeight => FontWeight.w400;

  static double? get letterSpacing => null;


}