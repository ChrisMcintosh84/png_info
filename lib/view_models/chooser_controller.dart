import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:png_info/models/my_input_type.dart';
import 'package:png_info/models/my_node.dart';
import 'package:png_info/models/my_number_type.dart';
import 'package:png_info/models/my_type.dart';

class ChooserController extends GetxController {
  File? selectedImage;
  RxString imagePath = "".obs;
  RxString textOutput = "".obs;
  RxBool isComfy = false.obs;
  final nodes = <MyNode>[].obs;

  Future<void> chooseFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      File file = File(result.files.single.path!);
      imagePath.value = file.path;
      _getMetaData();
    }
  }

  Future<void> _getMetaData() async {
    final Image image = decodeImage(File(imagePath.value).readAsBytesSync())!;
    _printObjects(image);

    textOutput.value = "Image format: ${image.format}\nImage width: ${image.width}\nImage height: ${image.height}";
  }

  void _printObjects(Image image) {
    if (image.textData != null) {
      Map<String, dynamic> data = image.textData!;

      List<MyType> typeList = [];

      data.forEach((key, value) {
        MyType myType = MyType(name: key, data: value);
        typeList.add(myType);
      });

      List<MyNumberType> numberList = [];
      for (var item in typeList) {
        Map<String, dynamic> map = jsonDecode(item.data);
        map.forEach((key, value) {
          if (key.isNumericOnly) {
            MyNumberType numberType = MyNumberType(number: key, data: value);
            numberList.add(numberType);
          }
        });
      }

      List<MyInputType> inputList = [];
      for (var item in numberList) {
        if (item.data is Map) {
          Map<String, dynamic> map = item.data;
          map.forEach((key, value) {
            MyInputType inputType = MyInputType(name: key, data: value);
            inputList.add(inputType);
          });
        }
      }

      MyNode? currentNode;

      for (var item in inputList) {
        if (item.name == 'inputs') {
          currentNode ??= MyNode();
          currentNode.inputData = item.data;
        }
        else if (item.name == 'class_type') {
          currentNode ??= MyNode();
          currentNode.classTypeData = item.data;
        }

        if (currentNode != null && currentNode.inputData != null && currentNode.classTypeData != null) {
          nodes.add(currentNode);
          currentNode = null;
        }
      }
    }
  }

  void toggleIsComfy() {
    isComfy.value = !isComfy.value;
    print(isComfy.value);
  }
}