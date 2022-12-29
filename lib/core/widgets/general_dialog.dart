import 'package:flutter/material.dart';
import '../navigation/navigation_service.dart';

Future generalDialog(Widget widget) async {
  return await showGeneralDialog(
    barrierDismissible: false,
    barrierLabel: "Barrier",
    context: NavigationService.instance.navigatorKey.currentContext!,
    pageBuilder: (_, __, ___) {
      return widget;
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}
