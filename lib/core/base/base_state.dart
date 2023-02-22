import 'package:core_project/core/log/page_logger/logger_mixin.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> with LoggerMixin,TickerProviderStateMixin, WidgetsBindingObserver{
  
}
