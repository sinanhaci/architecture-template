import 'package:flutter/material.dart';
import '../localization/localization_helper.dart';


class LocalizationConfiguration{
  LocalizationConfiguration._();
  static const List<Locale> supportedLocale = [LocalizationHelper.trLocale];
}