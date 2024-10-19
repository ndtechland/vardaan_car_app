// Function to handle image selection
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/handle_image_selection.dart';
import '../../controller/selection_option_controller.dart';

Future<void> handleImageSelection1() async {
  optionsImage1();
  await optionsController.selectOption();
  optionsController.saveSelection(); // Set isImageSelected to true
  //await _doctorrUploadReportController.getdoctorrpatientApi();
  //await _doctorrUploadReportController.getdoctorrpatientApi();
}

final OptionsController optionsController = Get.put(OptionsController());
final SelectionController selectionController = Get.put(SelectionController());

///final OptionsController optionsController = Get.put(OptionsController());

// Modify your optionsImage function to utilize this controller
Future<void> optionsImage1() async {
  Get.defaultDialog(
    title: "Select an option",
    titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    content: SizedBox(
      width: 780,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              selectionController.getImage(ImageSource.camera);
              Get.back();

              optionsController.refresh();
              //optionsController.onInit();
              optionsController.update();
              await optionsController.selectOption();
              //optionsController.selectOption();
              optionsController.refresh();
              optionsController.update();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_enhance,
                  color: Color.fromARGB(255, 34, 126, 201),
                  size: 25,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Camera",
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 126, 201),
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 34, 126, 201),
            endIndent: 70,
            indent: 70,
          ),
          InkWell(
            onTap: () async {
              await selectionController.getImage(ImageSource.gallery);
              Get.back();
              optionsController.refresh();
              //optionsController.onInit();
              optionsController.update();
              await optionsController.selectOption();
              //optionsController.selectOption();
              optionsController.refresh();
              optionsController.update();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo,
                  color: Color.fromARGB(255, 34, 126, 201),
                  size: 25,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  " Gallery ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 126, 201),
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),

          ///
        ],
      ),
    ),
  );
}
