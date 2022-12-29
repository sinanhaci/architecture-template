import 'package:flutter/material.dart';

import '../localization/localization_controller.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(tr.routeError),
      ),
    );
  }
}
