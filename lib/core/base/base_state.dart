import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  Size get size => MediaQuery.of(context).size;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
}
