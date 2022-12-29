abstract class IPermissionManager {
  Future<bool> checkMediaLibrary();
  Future<bool> mediaLibraryRequest();

  Future<bool> checkCamera();
  Future<bool> cameraRequest();
  
}