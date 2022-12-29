// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/api/base_api_services/base_request_services.dart';
import '../../../core/base/base_view_model.dart';
part 'nav_bar_controller.g.dart';

class NavBarController = _NavBarControllerBase with _$NavBarController;

abstract class _NavBarControllerBase extends BaseRequestMethod with Store, BaseViewModel {
  
  @override
  void setContext(BuildContext context) {
    context = context;
    theme = Theme.of(context);
    size = MediaQuery.of(context).size;
  }

  @override
  void init() {}

  @override
  void dispose() {}

}