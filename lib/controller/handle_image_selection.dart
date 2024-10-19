import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OptionsController extends GetxController {
  RxBool isOptionSelected = false.obs;
  RxString selectedImagePath = ''.obs;
  RxBool isImageSelected = false.obs;

  // void resetSelection() {
  //   isOptionSelected.value = false;
  // }
  ///

  // void saveSelection(String imagePath) {
  //   selectedImagePath.value = imagePath;
  //   // Perform additional actions such as saving the selected image to storage or database
  // }

  Future<void> selectOption() async {
    isOptionSelected.value = true;
    //selectionController.
  }

  void saveSelection() {
    isImageSelected.value = true;
    // Add any additional logic here if needed
  }

  void resetSelection() {
    isImageSelected.value = false;
    // Add any additional logic here if needed
  }
}
