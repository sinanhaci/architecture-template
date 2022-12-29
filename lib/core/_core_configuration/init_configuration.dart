import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import '../api/base_api_services/base_request_services.dart';
import '../cache/local_cache_controller.dart';
import '../localization/localization_controller.dart';
import '../log/exception_logger/sentry.dart';
import '../theme/app_theme_controller.dart';

class AppConfiguration {
  AppConfiguration._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded(
      () async {
        await LocalCache.init();
        await AppThemeController.init();
        await LocalizationController.init();
        await BaseRequestMethod().dioInitialize();
        //await LocalNotificationController().init();
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        SentryConfiguration.init(const CoreApp());
      },
      SentryConfiguration.captureException,
    );
  }
}
