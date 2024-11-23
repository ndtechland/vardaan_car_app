import 'dart:convert';

import 'package:get/get.dart';
import 'package:vardaancar/api_services/api_services_call.dart';
import 'package:vardaancar/controller/driver_controller/profile_controller_driver.dart';

class UpdateDriverProfileController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  ProfileController _profileController = Get.put(ProfileController());

  RxBool isLoading = false.obs;

  Future<void> updateDriverProfilePic({
    required int id,
    required String driverImage,
    required String driverImageBase64,
  }) async {
    isLoading.value = true;

    try {
      final response = await _apiProvider.updateDriverProfilePic(
        id: _profileController.getdriverprofileModel!.data!.id!.toInt(),
        driverImage: driverImage,
        driverImageBase64: driverImageBase64,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["Succeeded"] == true) {
          Get.snackbar("Success", "Profile picture updated successfully.");
        } else {
          Get.snackbar(
              "Error", data["Message"] ?? "Failed to update profile picture.");
        }
      } else {
        Get.snackbar("Error", "Failed to connect to the server.");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
