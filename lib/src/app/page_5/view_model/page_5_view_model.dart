// ignore_for_file: library_private_types_in_public_api

import 'package:core_project/core/api/base_api_services/base_request_services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/base_view_model.dart';
part 'page_5_view_model.g.dart';

class Page5ViewModel = _Page5ViewModelBase with _$Page5ViewModel;

abstract class _Page5ViewModelBase extends BaseRequestMethod with Store, BaseViewModel {
  
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