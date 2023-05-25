import 'package:flutter_essential_components/controllers/file_picker.dart';
import 'package:flutter_essential_components/controllers/image_picker_controller.dart';
import 'package:get/get.dart';

class Controllers implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ImagePickerController());
    Get.lazyPut(() => File_Picker());
  }
}
