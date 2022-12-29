
import 'package:flutter/material.dart';
import '../_core_configuration/navigation_configuration.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    return NavigationConfiguration.appRoute(args,normalNavigate);
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: pageName));
  }
}
