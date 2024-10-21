import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module/user/language_screen.dart';

class OtpController extends GetxController {
  var otpControllers = List.generate(4, (index) => TextEditingController());
  var otp = ''.obs;

  var isResendButtonVisible = false.obs;
  var countdown = 30.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    countdown.value = 30;
    isResendButtonVisible.value = false;

    Future.delayed(Duration(seconds: 30), () {
      isResendButtonVisible.value = true;
    });

    countdownTimer();
  }

  void countdownTimer() async {
    for (int i = 30; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      countdown.value--;
    }
  }

  void resendOtp() {
    startTimer();
    // Logic to resend OTP here
    Get.snackbar('OTP Resent', 'A new OTP has been sent to your phone');
  }

  void verifyOtp() {
    if (otp.value.length == 4) {
      // Perform OTP verification here
      Get.snackbar('Success', 'OTP Verified');
      Get.to(LanguagePagess());
      //LanguagePagess
    } else {
      Get.snackbar('Error', 'Please enter all 4 digits of the OTP');
    }
  }
}
