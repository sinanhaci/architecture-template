import 'package:flutter/material.dart';

import '../cache/local_cache_controller.dart';
import '../constants/enums/cache_enums.dart';


class AppThemeController{
  static late ValueNotifier<ThemeMode> themeMode;
  
  static AppThemeController? _instance;
  static AppThemeController get instance {
    _instance ??= AppThemeController._init();
    return _instance!;
  }

  AppThemeController._init();

  static set getThemeMode (String? value) {
    if(value == null)  return _nullValue();
     AppThemeController.themeMode = value == ThemeMode.dark.name ? ValueNotifier<ThemeMode>(ThemeMode.dark) : ValueNotifier<ThemeMode>(ThemeMode.light); 
  }
  
  static void _nullValue() async {
     var brignes = WidgetsBinding.instance.window.platformBrightness;
     await LocalCache.setString(CacheEnum.theme, brignes == Brightness.dark ? ThemeMode.dark.name : ThemeMode.light.name);
     AppThemeController.themeMode = ValueNotifier<ThemeMode>(brignes == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
  }

  static init() async {
    AppThemeController.getThemeMode = LocalCache.getString(CacheEnum.theme);
  }


  ///CHANGE THEME MODE
  ///
  ///EXAMPLE
  ///
  ///await AppThemeController.changeTheme();
  ///
  ///
  ///
  static Future<void> changeTheme() async {
    late ThemeMode changedThemeValue;
    if(AppThemeController.themeMode.value == ThemeMode.dark){
      changedThemeValue = ThemeMode.light;
    }else{
      changedThemeValue = ThemeMode.dark;
    }

    await LocalCache.setString(CacheEnum.theme, changedThemeValue.name);
    AppThemeController.themeMode.value = changedThemeValue;
  }
}