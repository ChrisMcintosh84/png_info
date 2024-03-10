import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:png_info/view_models/chooser_controller.dart';
import 'package:png_info/widgets/info_column.dart';
import 'package:png_info/widgets/my_gesture_detector.dart';

import '../widgets/text_output_widget.dart';

class HomeView extends GetView<ChooserController> {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to PNG Info!"),
      ),
      body: Row(
        children: [
          Column(
            children: [
              SizedBox(
                child: MyGestureDetector(
                  onTap: () {
                    controller.chooseFile();
                  },
                ),
              ),
              const TextOutputWidget(),
            ],
          ),
          const InfoColumn()
        ],
      )
    );
  }
}