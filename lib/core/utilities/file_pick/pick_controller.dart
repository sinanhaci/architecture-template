import 'package:image_picker/image_picker.dart';
import '../../constants/enums/pick_type_enum.dart';
import 'pick_manager.dart';
import 'picker_helper.dart';



class PickController<T> extends PickHelper implements IPickManager {

  @override
/// ```dart
/// 
/// 
/// [Example]
/// 
/// var result = await PickController<String?>().pickImage(ImageSource.gallery, returnFileType: PickFileType.base64);
/// print(result);
/// 
/// 
/// ```
  Future<T?> pickImage(ImageSource source,{PickFileType returnFileType = PickFileType.xFile,bool cropImage = true}) async {

    var permission = source == ImageSource.gallery ? await permissionController.mediaLibraryRequest() : await permissionController.cameraRequest();
    if(permission){
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        if (cropImage) {
          var croppedImage = await cropper.imageCropper(image);
          return await returnedFileType(croppedImage, returnFileType);
        } else {
          return await returnedFileType(image, returnFileType);
        }
      }
    }
    return null;
  }

  @override
/// ```dart
/// 
/// 
/// [Example]
/// 
/// var result = await PickController<String?>().pickMultiImage(returnFileType: PickFileType.base64);
/// print(result);
/// 
/// 
/// ```
  Future<List<T>> pickMultiImage({PickFileType returnFileType = PickFileType.xFile}) async {
    List<T> pickList = [];
    if(await permissionController.mediaLibraryRequest()){
      final List<XFile> image = await picker.pickMultiImage();
      if (image.isNotEmpty) {
        await Future.forEach<XFile>(image,(element) async {
          pickList.add(await returnedFileType(element, returnFileType));
        });
        return pickList;
      }
    }
    return [];
  }
  
  @override
/// ```dart
/// 
/// 
/// [Example]
/// 
/// var result = await PickController<String?>().pickVideo(ImageSource.gallery, returnFileType: PickFileType.base64,maxDuration:Duration(seconds:3));
/// print(result);
/// 
/// 
/// ```
  Future pickVideo(ImageSource source, {PickFileType returnFileType = PickFileType.xFile,Duration? maxDuration}) async {
    var permission = source == ImageSource.gallery ? await permissionController.mediaLibraryRequest() : await permissionController.cameraRequest();
    if(permission){
      final XFile? image = await picker.pickVideo(source: source,maxDuration: maxDuration);
      if (image != null) {
        return await returnedFileType(image, returnFileType);
      }
    }
    return null;
  }

}

