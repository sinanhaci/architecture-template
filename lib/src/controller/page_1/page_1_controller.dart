// ignore_for_file: library_private_types_in_public_api

import '../../../core/api/base_api_services/base_request_services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/base_view_model.dart';
part 'page_1_controller.g.dart';

class Page1Controller = _Page1ControllerBase with _$Page1Controller;

abstract class _Page1ControllerBase extends BaseRequestMethod with Store, BaseViewModel {
  
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