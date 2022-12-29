import 'dart:developer';
import 'log_model.dart';


class ProjectCustomLog {
  static ProjectCustomLog? _instance;
  static ProjectCustomLog get instance {
    _instance ??= ProjectCustomLog._init();
    return _instance!;
  }

  ProjectCustomLog._init();

  void logClassName<T>(T page) {
    log('Current Class Name : $page');
  }

  void logPageName(PageLoggerKeys keys) {
    log('Current Page : ${keys.name}');
  }

}