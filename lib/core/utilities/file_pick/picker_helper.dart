import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../constants/enums/pick_type_enum.dart';
import '../image_crop/image_cropper_controller.dart';
import '../permission_controller/permission_controller.dart';

class PickHelper{
  final ImagePicker picker = ImagePicker();
  final ImageCropperController cropper = ImageCropperController();
  final ApplicationPermissionController permissionController = ApplicationPermissionController();


  Future returnedFileType(var image, PickFileType returnFileType) async {
    if (image != null) {
      switch (returnFileType) {
        case PickFileType.base64:
          var imageBytes = await image.readAsBytes();
          return base64Encode(imageBytes);
        case PickFileType.file:
          return File(image.path);
        case PickFileType.xFile:
          return XFile(image.path);
      }
    }
    return null;
  }
}