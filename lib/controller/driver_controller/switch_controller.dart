import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool isSwitchOn = false.obs;

  void toggleSwitch(bool value) {
    isSwitchOn.value = value;
  }

  void changeSwitchStateFromDialog() {
    isSwitchOn.value = true; // Or handle based on dialog logic.
  }
}
