import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../_core_configuration/logger_configuration.dart';

class SentryConfiguration {
  SentryConfiguration._();
  static const String _dsn = LoggerConfiguration.sentryDsnId;
  static const double _tracessSampleRate = LoggerConfiguration.sentrySampleRate;

  static Future<void> init(Widget app) async {
    if (kDebugMode) return runApp(app);
    await SentryFlutter.init(
      (options) {
        options.dsn = _dsn;
        options.tracesSampleRate = _tracessSampleRate;
      },
      appRunner: () => runApp(app),
    );
  }

  static Future<void> captureException(Object throwable, StackTrace stackTrace)async{
    if (!kDebugMode) await Sentry.captureException(throwable, stackTrace: stackTrace); 
  }
}
