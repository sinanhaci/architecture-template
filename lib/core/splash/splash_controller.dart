// ignore_for_file: library_private_types_in_public_api


import '../_core_configuration/navigation_configuration.dart';
import '../_core_configuration/splash_configuration.dart';
import '../api/base_api_services/base_request_services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../base/base_view_model.dart';
import '../localization/localization_manager.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase  extends BaseRequestMethod with Store, BaseViewModel {
  
  @override
  void setContext(BuildContext context) {
    context = context;
    theme = Theme.of(context);
    size = MediaQuery.of(context).size;
    LocalizationManager.init(context);
  }

  @override
  void init() {
    initApp();
  }

  @override
  void dispose() {}

  Future<void> initApp() async{
    await Future.delayed(SplashConfiguration.splashDuration,(){
      navigation.navigateToPageClear(path: NavigationConfiguration.NAVBAR);
    });
  }

}