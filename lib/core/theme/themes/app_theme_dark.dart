import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_theme_manager.dart';
import '../dark_theme/dark_theme_interface.dart';
import '../../theme/extensions/color_extensions.dart';


class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        colorScheme: _appColorScheme,
        textTheme: textThemes,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          backgroundColor: colorSchemeDark.onBackground,
              systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: _appColorScheme.scaffoldBackround,
      );

  TextTheme get textThemes =>
    ThemeData.dark().textTheme.copyWith(
          headline1: textThemeDark.xLargeNormal.apply(color: _appColorScheme.primary),
          headline2: textThemeDark.largeNormal.apply(color: _appColorScheme.primary),
          headline3: textThemeDark.mediumNormal.apply(color: _appColorScheme.primary),
          headline4: textThemeDark.normalNormal.apply(color: _appColorScheme.primary),
          headline5: textThemeDark.smallNormal.apply(color: _appColorScheme.primary),
          headline6: textThemeDark.xSmallNormal.apply(color: _appColorScheme.primary),
          subtitle1: textThemeDark.xLargeBold.apply(color: _appColorScheme.primary),
          subtitle2: textThemeDark.largeBold.apply(color: _appColorScheme.primary),
          bodyText1: textThemeDark.mediumBold.apply(color: _appColorScheme.primary),
          bodyText2: textThemeDark.normalBold.apply(color: _appColorScheme.primary),
          overline: textThemeDark.xSmallBold.apply(color: _appColorScheme.primary),
          caption: textThemeDark.smallBold.apply(color: _appColorScheme.primary),
        );
  

  ColorScheme get _appColorScheme {
    return const ColorScheme.dark().copyWith(
      background: colorSchemeDark.background,
      onBackground: colorSchemeDark.onBackground,
      primary: colorSchemeDark.primary,
      secondary: colorSchemeDark.secondary,
      error: colorSchemeDark.error,
      inversePrimary: colorSchemeDark.inversePrimary,
      brightness: Brightness.dark,
    );
  }
}
