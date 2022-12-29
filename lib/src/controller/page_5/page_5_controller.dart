// ignore_for_file: library_private_types_in_public_api

import '../../../core/api/base_api_services/base_request_services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/base_view_model.dart';

part 'page_5_controller.g.dart';

class Page5Controller = _Page5ControllerBase with _$Page5Controller;

abstract class _Page5ControllerBase extends BaseRequestMethod with Store, BaseViewModel {
  
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