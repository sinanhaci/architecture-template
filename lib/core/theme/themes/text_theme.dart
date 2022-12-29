import 'package:flutter/material.dart';
import '../../_core_configuration/font_configuration.dart';

class TextTheme {
  static TextTheme? _instace;
  static TextTheme get instance {
    _instace ??= TextTheme._init();
    return _instace!;
  }

  TextTheme._init();


  final TextStyle xLargeBold = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.xLargeSize, fontWeight: FontConfiguration.boldFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle largeBold = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.largeSize, fontWeight: FontConfiguration.boldFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle mediumBold = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.mediumSize, fontWeight: FontConfiguration.boldFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle normalBold = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.normalSize, fontWeight: FontConfiguration.boldFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle smallBold = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.smallSize, fontWeight: FontConfiguration.boldFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle xSmallBold = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.xSmallSize, fontWeight: FontConfiguration.boldFontWeight,letterSpacing: FontConfiguration.letterSpacing);


  
  final TextStyle xLargeNormal = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.xLargeSize, fontWeight: FontConfiguration.normalFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle largeNormal = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.largeSize, fontWeight: FontConfiguration.normalFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle mediumNormal = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.mediumSize, fontWeight: FontConfiguration.normalFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle normalNormal = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.normalSize, fontWeight: FontConfiguration.normalFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle smallNormal = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.smallSize, fontWeight: FontConfiguration.normalFontWeight,letterSpacing: FontConfiguration.letterSpacing);
  final TextStyle xSmallNormal = FontConfiguration.appFont.copyWith(fontSize: FontConfiguration.xSmallSize, fontWeight: FontConfiguration.normalFontWeight,letterSpacing: FontConfiguration.letterSpacing);

}
