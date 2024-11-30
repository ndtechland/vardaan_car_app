// ChangePasswordController.dart

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api_services/api_services_call.dart';
import '../../module/user/home_page.dart';

class FeedbackEmployeeController extends GetxController {
  final GlobalKey<FormState> feedbackemployeeFormKey = GlobalKey<FormState>();

  final TextEditingController passwordController1 = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> FeedbackEmployeeApi(BuildContext context) async {
    try {
      isLoading.value = false;

      final response = await ApiProvider.FeedbackEmployeeApi(
          context, // Pass the context
          passwordController1.text);

      if (response?.statusCode == 200) {
        // Navigate to Home Page
        Get.to(() => HomePage());

        //Get.off(() => Home());
      } else {
        // Handle other status codes or errors
        // Get.snackbar('Error', 'Failed to change password. Please try again.');
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      //Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers, listeners, etc.
  }

  String? validateUser(String value) {
    if (value.isEmpty) {
      return 'Please provide a username';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 4) {
      return 'Please provide a valid password';
    }
    return null;
  }

  void checkFeedback(BuildContext context) {
    if (feedbackemployeeFormKey.currentState!.validate()) {
      feedbackemployeeFormKey.currentState!.save();
      FeedbackEmployeeApi(context); // Pass the context
    }
  }
}
