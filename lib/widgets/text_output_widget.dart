import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:png_info/view_models/chooser_controller.dart';

class TextOutputWidget extends GetView<ChooserController> {

  const TextOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text("${controller.textOutput}"));
  }
}