import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:png_info/view_models/chooser_controller.dart';

class MyGestureDetector extends StatelessWidget {
  final VoidCallback onTap;

  final ChooserController _controller = Get.find();

  MyGestureDetector({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
          () => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: _controller.imagePath.value.isNotEmpty
            ? Image.file(File(_controller.imagePath.value), width: 400, height: 400)
              : const Icon(Icons.add_a_photo, size: 400, color: Colors.grey),
        ),
      ),
    );
  }
}