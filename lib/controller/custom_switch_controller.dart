import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Service class to handle API calls
class SwitchService {
  Future<bool> fetchSwitchState() async {
    // Make API call to fetch switch state
    // For simplicity, returning a hardcoded value
    return true; // Or you might fetch this from your API response
  }
}

// Controller for the custom switch widget
class CustomSwitchController extends GetxController {
  var switchState = true.obs; // Initial state

  void fetchSwitchState() async {
    final service = SwitchService();
    switchState.value = await service.fetchSwitchState();
  }

  void toggleSwitch() {
    switchState.value = !switchState.value;
    // Call API to update switch state if needed
  }
}

class CustomSwitch extends StatelessWidget {
  final CustomSwitchController controller;

  CustomSwitch({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: () {
            controller.toggleSwitch();
          },
          child: Container(
            width: 48.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: controller.switchState.value ? Colors.green : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                alignment: controller.switchState.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
