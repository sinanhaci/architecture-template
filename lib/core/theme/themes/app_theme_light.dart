import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_theme_manager.dart';
import '../light_theme/light_theme_interface.dart';
import '../../theme/extensions/color_extensions.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        brightness: Brightness.light,
        colorScheme: _appColorScheme,
        textTheme: textThemes,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: colorSchemeLight.onBackground,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: _appColorScheme.scaffoldBackround,
      );

  TextTheme get textThemes =>
   ThemeData.light().textTheme.copyWith(
          headline1: textThemeLight.xLargeNormal.apply(color: _appColorScheme.primary),
          headline2: textThemeLight.largeNormal.apply(color: _appColorScheme.primary),
          headline3: textThemeLight.mediumNormal.apply(color: _appColorScheme.primary),
          headline4: textThemeLight.normalNormal.apply(color: _appColorScheme.primary),
          headline5: textThemeLight.smallNormal.apply(color: _appColorScheme.primary),
          headline6: textThemeLight.xSmallNormal.apply(color: _appColorScheme.primary),
          subtitle1: textThemeLight.xLargeBold.apply(color: _appColorScheme.primary),
          subtitle2: textThemeLight.largeBold.apply(color: _appColorScheme.primary),
          bodyText1: textThemeLight.mediumBold.apply(color: _appColorScheme.primary),
          bodyText2: textThemeLight.normalBold.apply(color: _appColorScheme.primary),
          overline: textThemeLight.xSmallBold.apply(color: _appColorScheme.primary),
          caption: textThemeLight.smallBold.apply(color: _appColorScheme.primary),
        );
  

  ColorScheme get _appColorScheme {
    return const ColorScheme.light().copyWith(
      background: colorSchemeLight.background,
      onBackground: colorSchemeLight.onBackground,
      primary: colorSchemeLight.primary,
      secondary: colorSchemeLight.secondary,
      error: colorSchemeLight.error,
      inversePrimary: colorSchemeLight.inversePrimary,
      brightness: Brightness.light,
    );
  }
}
