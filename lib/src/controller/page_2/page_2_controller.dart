// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/api/base_api_services/base_request_services.dart';
import '../../../core/base/base_view_model.dart';

part 'page_2_controller.g.dart';

class Page2Controller = _Page2ControllerBase with _$Page2Controller;

abstract class _Page2ControllerBase extends BaseRequestMethod with Store, BaseViewModel {
  
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