import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:native_widgets/enums/dialog_type.dart';
import 'package:native_widgets/models/button_properties_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../_core_configuration/localization_configuration.dart';
import '../cache/local_cache_controller.dart';
import '../constants/enums/cache_enums.dart';
import '../navigation/navigation_service.dart';
import '../utilities/notification/local_notification/local_notification_controller.dart';
import '../widgets/native_widgets/native_widgets.dart';
import 'localization_helper.dart';
import 'localization_manager.dart';

AppLocalizations get tr => initTr!;

class LocalizationController extends LocalizationHelper
    implements LocalizationManager {
  static late Locale deviceLocale;
  static LocalizationController? _instance;
  static LocalizationController get instance {
    _instance ??= LocalizationController._init();
    return _instance!;
  }

  LocalizationController._init();
  @override
  List<Locale> get supportedLocale => LocalizationConfiguration.supportedLocale;
  @override
  List<LocalizationsDelegate<Object>> get localizationsDelegates => [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ];

  static Future<void> init() async{
    await LocalCache.setString(CacheEnum.locale,const Locale('tr', 'TR').languageCode);
    LocalizationController.setLocale = LocalCache.getString(CacheEnum.locale);
  }

  static set setLocale(String? value) {
    if (value == null) return _setLanguage();
    deviceLocale = _writeCacheLanguage(value);
  }

  static void _setLanguage() async {
    var deviceLocalization = Platform.localeName;
    await LocalCache.setString(CacheEnum.locale, deviceLocalization);
    deviceLocale = _writeCacheLanguage(deviceLocalization);
  }

  static Locale _writeCacheLanguage(String value) {
    Locale deviceLocalization = const Locale('en' 'Us');
    for (var element in LocalizationController.instance.supportedLocale) {
      if (element.languageCode.toString() == value) {
        LocalCache.setString(CacheEnum.locale, value);
        deviceLocalization = element;
      }
    }
    return deviceLocalization;
  }

  static _changeLanguage(Locale locale) async {
    DateTime now = DateTime( DateTime.now().year,DateTime.now().month,DateTime.now().day,DateTime.now().hour,DateTime.now().minute, DateTime.now().second + 1);
    await LocalCache.setString(CacheEnum.locale, locale.languageCode);
    await LocalNotificationController().scheduleNotification(
        id: 0, title: 'title', body: 'body', seconds: 3, notificationTime: now);
    setLocale = LocalCache.getString(CacheEnum.locale);
    Navigator.pop(NavigationService.instance.navigatorKey.currentContext!);
    //exit(0);
  }

  static changeLanguage(Locale locale,String lang) {
    NativeWidget.dialog(
      okButtonText: tr.change,
      title: tr.languageChangeTitle,
      content: tr.languageChangeContent(lang),
      onPress: () async => _changeLanguage(locale),
      dialogType: DialogType.okCancel,
      isDefaultAction: true,
      cancelButtonProperties: ButtonProperties(
        buttonText: tr.cancel,
        onPress: () async => Navigator.pop(NavigationService.instance.navigatorKey.currentContext!),
      ),
    );
  }
}
