import 'package:permission_handler/permission_handler.dart';
import 'permission_helper.dart';
import 'permission_manager.dart';


enum PermissionType{
  gallery,
  camera
}


class ApplicationPermissionController extends ApplicationPermissionHelper implements IPermissionManager {
  @override
  Future<bool> checkMediaLibrary() async {
    final status = await Permission.photos.status;
    return status.isGranted;
  }

  @override
  Future<bool> mediaLibraryRequest() async {
    if(!await checkMediaLibrary()){
      final status = await Permission.photos.request();
      return await actionByStatus(status,PermissionType.gallery);      
    }
    return true;
  }

  @override
  Future<bool> checkCamera() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }
  
  @override
  Future<bool> cameraRequest() async{
    if(!await checkCamera()){
      final status = await Permission.camera.request();
      return await actionByStatus(status,PermissionType.camera);      
    }
    return true;
  }
  
}







