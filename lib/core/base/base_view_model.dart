import 'package:flutter/material.dart';
import '../navigation/navigation_service.dart';

abstract class BaseViewModel{
  NavigationService navigation = NavigationService.instance;
  late Size size;
  late ThemeData theme;
  void setContext(BuildContext context);
  void init();
  void dispose();
}
