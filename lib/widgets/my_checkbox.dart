import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:png_info/view_models/chooser_controller.dart';

class MyCheckbox extends GetView<ChooserController> {
  final String label;

  const MyCheckbox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return const Text("widget");
  }

}