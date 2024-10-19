import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class SelectionController extends GetxController {
  RxString selectedPDFName = ''.obs;
  RxString selectedPDFPath = ''.obs;
  RxInt selectedValueradio = 0.obs;

  final selectedIndices = <int>[].obs;
  var isChecked = false.obs;
  RxInt selectedimg = 0.obs;

  TextEditingController imagePath = TextEditingController();
  TextEditingController imagebase = TextEditingController();

  var selectedPath = ''.obs;

  var selectedValue = "Select Id Proof".obs;

  ///todo: selected image fromm image picker..
  Future<void> getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
      print("File Path ${pickedFiles.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  ///radio button..
  void setSelectedValue(int value) {
    selectedValueradio.value = value;
  }

  ///todo: file picker....
  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      File pickedFile = File(result.files.single.path!);
      int fileSize = await pickedFile.length();

      if (fileSize <= 10 * 1024 * 1024) {
        // File size is within limits, proceed
        selectedPDFName.value = result.files.single.name!;
        selectedPDFPath.value = result.files.single.path!;
      } else {
        // File size exceeds limit, show error message
        Get.snackbar('Error', 'Selected PDF is too large (must be <= 10 MB)',
            duration: Duration(seconds: 2));
      }
    } else {
      // User canceled the picker or no file selected
      Get.snackbar('Error', 'No PDF selected', duration: Duration(seconds: 2));
    }
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }

  ///todo: api for document upload...

  // Future<void> postdoctorUploadreportApi() async {
  //   CallLoader.loader();
  //   final imageAsBase64 =
  //   base64Encode(await File(selectedPath.value).readAsBytes());
  //   http.Response r = await ApiProvider.doctorruploadreportApi(
  //     //selectedpatient.value?.subid.toString(),
  //       selectedpatient.value?.id.toString(),
  //       selectedPath.value.split('/').last,
  //       imageAsBase64);
  //
  //   if (r.statusCode == 200) {
  //     CallLoader.hideLoader();
  //
  //     /// we can navigate to user page.....................................
  //     Get.to(DoctorHomePage());
  //   } else {
  //     CallLoader.hideLoader();
  //   }
  // }

  ///this is selectrd container...
  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      // Deselect the container if it's already selected
      selectedIndices.remove(index);
    } else {
      // Select the container and deselect all others
      selectedIndices.clear();
      selectedIndices.add(index);
    }
  }

  //image picker
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  ///checkbox controlller...
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}
