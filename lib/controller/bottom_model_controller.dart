import 'package:get/get.dart';

import '../weightsss/bottombar_weight.dart';

class BottomSheetController extends GetxController {
  bool _isBottomSheetOpen = false; // Flag to track bottom sheet state

  // This function will show the bottom sheet
  void showBottomSheet() {
    // Check if the bottom sheet is already open
    if (!_isBottomSheetOpen) {
      _isBottomSheetOpen = true; // Set the flag to true

      Get.bottomSheet(
        const BottomSheetWidget(), // Use the BottomSheetWidget
        isScrollControlled: true,
      ).whenComplete(() {
        _isBottomSheetOpen = false; // Reset the flag when closed
      });
    }
  }
}
