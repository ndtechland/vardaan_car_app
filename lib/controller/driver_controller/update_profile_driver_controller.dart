// ChangePasswordController.dart

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api_services/api_services_call.dart';
import '../../module/driver/home_page_driver.dart';

class UpdateProfileDriverController extends GetxController {
  final GlobalKey<FormState> updateprofiledriverFormKey =
      GlobalKey<FormState>();

  final TextEditingController drivernameController = TextEditingController();
  // final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController alternatephoneController =
      TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> UpdateProfileeApi(BuildContext context) async {
    try {
      isLoading.value = false;

      final response = await ApiProvider.UpdateProfileDriverApi(
        context, // Pass the context
        drivernameController.text,
        emailController.text,
        addressController.text,
        alternatephoneController.text,
      );

      if (response?.statusCode == 200) {
        // Navigate to Home Page
        Get.to(() => HomePageDriver());

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

  void checkUpdateProfileDriver(BuildContext context) {
    if (updateprofiledriverFormKey.currentState!.validate()) {
      updateprofiledriverFormKey.currentState!.save();
      UpdateProfileeApi(context); // Pass the context
    }
  }
}
