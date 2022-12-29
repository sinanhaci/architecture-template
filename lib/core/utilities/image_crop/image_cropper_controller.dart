import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../navigation/navigation_service.dart';

class ImageCropperController {
  var theme = Theme.of(NavigationService.instance.navigatorKey.currentContext!);

  Future<CroppedFile?> imageCropper(XFile file) async {
    return await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: _aspectRatioSettings(),
      uiSettings: _uiSettings(),
    );
  }

  List<CropAspectRatioPreset> _aspectRatioSettings() {
    return [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ];
  }

  List<PlatformUiSettings>? _uiSettings() {
    return [
      _androidSettings(),
      _iosUiSettings(),
    ];
  }

  AndroidUiSettings _androidSettings() {
    return AndroidUiSettings(
      toolbarTitle: '',
      toolbarColor: theme.appBarTheme.backgroundColor,
      toolbarWidgetColor: theme.appBarTheme.backgroundColor,
      initAspectRatio: CropAspectRatioPreset.original,
      lockAspectRatio: false,
      activeControlsWidgetColor: theme.colorScheme.primary,
    );
  }

  IOSUiSettings _iosUiSettings() {
    return IOSUiSettings(title: '', showCancelConfirmationDialog: true);
  }
}
