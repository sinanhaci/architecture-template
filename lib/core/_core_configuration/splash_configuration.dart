import 'package:flutter/material.dart';

class SplashConfiguration{
  SplashConfiguration._();
  static const Duration splashDuration = Duration(seconds: 1);
  static Widget get splashView => const Center(child: Icon(Icons.fire_extinguisher));
}