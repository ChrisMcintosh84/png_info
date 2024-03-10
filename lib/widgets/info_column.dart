import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:png_info/view_models/chooser_controller.dart';

class InfoColumn extends GetView<ChooserController> {

  const InfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
        Obx(() => ListView.builder(
          itemCount: controller.nodes.length,
          itemBuilder: (context, index) {
            final item = controller.nodes[index];
            return Card(
              child: ListTile(
                title: Text(item.classTypeData),
                subtitle: Text(item.inputData.toString()),
              ),
            );
          },
        )),

    );
  }

}