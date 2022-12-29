// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import '../../src/view/nav_bar/bottom_nav_bar.dart';
import '../navigation/not_found.dart';
import '../splash/splash_view.dart';

class NavigationConfiguration{
  NavigationConfiguration._();

  
  static const String DEFAULT = '/';
  static const String NAVBAR = '/navBar';




  static Route<dynamic> appRoute(RouteSettings args, MaterialPageRoute<dynamic> Function(Widget widget, String pageName) route){
    switch (args.name) {
      case DEFAULT:
        return route(const SplashView(),DEFAULT);
      case NAVBAR:
        return route(const BottomNavBar(),NAVBAR);
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }
}