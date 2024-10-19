import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../module/otp_page.dart';

class PhoneLoginController extends GetxController {
  var isLoading = false.obs;
  var phoneNumber = ''.obs;
  var errorMessage = ''.obs;

  void onPhoneNumberChanged(String value) {
    phoneNumber.value = value;
  }

  bool validatePhoneNumber() {
    if (phoneNumber.value.isEmpty || phoneNumber.value.length != 10) {
      errorMessage.value = "Enter a valid 10-digit phone number";
      return false;
    }
    return true;
  }

  Future<void> sendOtp() async {
    if (!validatePhoneNumber()) {
      Fluttertoast.showToast(msg: errorMessage.value);
      return;
    }

    isLoading.value = true;
    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      // On success
      Get.to(() => OtpPage());
      Get.toNamed('/otp');
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to send OTP");
    } finally {
      isLoading.value = false;
    }
  }
}
