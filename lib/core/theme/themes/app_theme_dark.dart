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
          displayLarge: textThemeDark.largeNormal.apply(color: _appColorScheme.primary),
          displayMedium: textThemeDark.mediumNormal.apply(color: _appColorScheme.primary),
          displaySmall: textThemeDark.smallNormal.apply(color: _appColorScheme.primary),
          headlineLarge: textThemeDark.largeBold.apply(color: _appColorScheme.primary),
          headlineMedium: textThemeDark.mediumBold.apply(color: _appColorScheme.primary),
          headlineSmall: textThemeDark.smallBold.apply(color: _appColorScheme.primary),
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
