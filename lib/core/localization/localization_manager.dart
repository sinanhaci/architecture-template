import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? initTr; 

abstract class LocalizationManager {
  static init(BuildContext context) {
    initTr = AppLocalizations.of(context);
  }
  
  List<Locale> get supportedLocale;
  List<LocalizationsDelegate<Object>>  get localizationsDelegates;
  
}