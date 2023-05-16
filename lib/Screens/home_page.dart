import 'package:flutter/material.dart';
import 'package:flutter_essential_components/controllers/image_picker_controller.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePickerController _imageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _imageController.getSingleImage();
              },
              child: const Text("Pick Single Image"),
            ),
            ElevatedButton(
              onPressed: () {
                _imageController.getMultipleImage();
              },
              child: const Text("Pick Multiple Image Image"),
            ),
          ],
        ),
      ),
    );
  }
}
