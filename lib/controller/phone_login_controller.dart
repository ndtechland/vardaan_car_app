import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vardaancar/api_services/api_services_call.dart';

import '../module/driver/home_page_driver.dart';
import '../module/driver/login_with_password.dart';
import '../module/user/otp_page.dart';

class PhoneLoginController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  RxString mobileNumber = "".obs;
  RxBool isLoading = false.obs;

  // Future<void> loginphone(String mobile) async {
  //   isLoading.value = true;
  //
  //   try {
  //     final response = await _apiProvider.Logindriveruser(mobile);
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //
  //       mobileNumber.value = mobile; //strore the miobile number
  //       await saveMobileToPreference(mobile); // save for reuse
  //       Get.snackbar("Success", "OTP Send Successfully.");
  //       Get.to(() => OtpPage(
  //             mobileNumber: mobile,
  //           ));
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "An error occurred: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Method to verify OTP
  ///todo: this is login phone api method....
  Future<void> loginphone(String mobile) async {
    isLoading.value = true;

    try {
      final response = await _apiProvider.Logindriveruser(mobile);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["Succeeded"] == true) {
          mobileNumber.value = mobile; // Store the mobile number
          await saveMobileToPreference(mobile); // Save for reuse

          if (data["Data"] == true) {
            // Navigate to OTP Page
            Get.snackbar("Success", "OTP Sent Successfully.");

            ///Get.to(() => LoginWithPassword(mobileNumber: mobile));

            Get.to(() => OtpPage(mobileNumber: mobile));
          } else {
            // Navigate to Login Password Page
            Get.snackbar("Info", "Proceed to Login with Password.");
            Get.to(() => LoginWithPassword(mobileNumber: mobile));
          }
        } else {
          Get.snackbar("Error", data["Message"] ?? "Something went wrong.");
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

  ///todo: this is the main thing to verify password

  Future<void> verifyOtp(String mobile, String otp) async {
    isLoading.value = true;
    try {
      final response = await _apiProvider.verifyOtpOrPassword(
          mobile, otp); // Assuming you have an API method for OTP verification
      if (response.values == 200) {
        // Handle success (e.g., navigate to the next page)
        Get.snackbar("Success", "OTP verified successfully");

        Get.to(HomePageDriver());
        // Add any next steps after successful OTP verification
      } else {
        // Get.to(HomePageDriver());

        // Get.snackbar("Error", "Invalid OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  ///todo: password email ....

  Future<void> verifyPasswordApi(String mobile, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiProvider.verifyPassword(mobile,
          password); // Assuming you have an API method for OTP verification
      if (response.values == 200) {
        // Handle success (e.g., navigate to the next page)
        Get.snackbar("Success", "Password verified successfully");

        Get.to(HomePageDriver());
        // Add any next steps after successful OTP verification
      } else {
        // Get.to(HomePageDriver());

        // Get.snackbar("Error", "Invalid OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveMobileToPreference(String mobile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mobileNumber', mobile);
  }

  Future<String?> getMobileFromPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('mobileNumber');
  }

  // var phoneNumber = ''.obs;
  // var errorMessage = ''.obs;
  // final TextEditingController phoneController = TextEditingController();
  //
  // void onPhoneNumberChanged(String value) {
  //   phoneNumber.value = value;
  // }
  //
  // bool validatePhoneNumber() {
  //   if (phoneNumber.value.isEmpty || phoneNumber.value.length != 10) {
  //     errorMessage.value = "Enter a valid 10-digit phone number";
  //     return false;
  //   }
  //   return true;
  // }
  //
  // Future<void> sendOtp() async {
  //   if (!validatePhoneNumber()) {
  //     Fluttertoast.showToast(msg: errorMessage.value);
  //     return;
  //   }
  //
  //   isLoading.value = true;
  //   try {
  //     // Simulate API call
  //     await Future.delayed(Duration(seconds: 2));
  //
  //     // On success
  //     Get.to(() => OtpPage());
  //     Get.toNamed('/otp');
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: "Failed to send OTP");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
