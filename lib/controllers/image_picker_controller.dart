import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class ImagePickerController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  Future<String?> getSingleImage() async {
    final XFile? responseData =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (responseData == null) return null;
    final byteImage = await responseData.readAsBytes();
    return "data:image/png;base64,${base64Encode(byteImage)}";
  }

  Future<List?> getMultipleImage() async {
    final List<XFile> responseData = await _imagePicker.pickMultiImage();

    if (responseData == null) return null;

    final base64Images = responseData.map((e) async {
      final byteImage = await e.readAsBytes();
      return "data:image/png;base64,${base64Encode(byteImage)}";
    }).toList();
    print("$base64Images");
    return base64Images;
  }
}
