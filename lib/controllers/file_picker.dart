import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class File_Picker extends GetxController {
  Future<File?> getSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print("$file ==============");
      return file;
    } else {
      print('Hello');
      return null;
    }
  }

  Future<List?> getMultipleFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      print(files.length);
      return files;
    } else {
      return null;
      // User canceled the picker
    }
  }
}
