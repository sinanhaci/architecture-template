import 'package:image_picker/image_picker.dart';
import '../../constants/enums/pick_type_enum.dart';



abstract class IPickManager<T> {
  Future<T?> pickImage(ImageSource source,{PickFileType returnFileType, bool cropImage});
  Future<List<T>> pickMultiImage({PickFileType returnFileType});
  Future<T?> pickVideo(ImageSource source,{PickFileType returnFileType,Duration maxDuration});
}
