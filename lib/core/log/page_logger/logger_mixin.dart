import 'dart:developer';

import 'log_model.dart';
import 'project_logger.dart';
import 'package:flutter/material.dart';

mixin LoggerMixin<T extends StatefulWidget> on State<T> {
  PageLoggerKeys get key;
  Function? get onDispose;
  @override
  void initState() {
    super.initState();
    ProjectCustomLog.instance.logClassName(this);
    ProjectCustomLog.instance.logPageName(key);
  }

  @override
  void dispose() {
    log('onDispose : ${key.name}');
    if(onDispose != null) onDispose!();
    super.dispose();
  }
}



