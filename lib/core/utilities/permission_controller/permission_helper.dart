import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../localization/localization_controller.dart';
import '../../navigation/navigation_service.dart';
import '../../widgets/native_widgets/native_widgets.dart';
import 'permission_controller.dart';

class ApplicationPermissionHelper{

  Future<bool> actionByStatus(PermissionStatus status,PermissionType type) async {
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      await _openAppSettings(type);
      return false;
    }
  }

  _openAppSettings(PermissionType type) {
    return NativeWidget.dialog(
      dialogType: DialogType.okCancel,
      title: tr.permissionDialogTitle,
      content: _getDialogContent(type),
      onPress: () async {
        await AppSettings.openAppSettings();
        Navigator.pop(NavigationService.instance.navigatorKey.currentContext!);
      },
      cancelButtonProperties: ButtonProperties(
        buttonText: tr.cancel,
        isDestructiveAction: true,
        onPress: () => Navigator.pop(NavigationService.instance.navigatorKey.currentContext!),
      ),
    );
  }

  String _getDialogContent(PermissionType type){
    switch (type) {
      case PermissionType.gallery:
        return tr.permissionDialogContent(tr.permissionGallery);
      case PermissionType.camera:
        return tr.permissionDialogContent(tr.permissionCamera);
    }
  }
}