// import 'package:get/get.dart';
//
// import '../module/otp_page.dart';
//
// class PhoneAuthController extends GetxController {
//   var phoneNumber = ''.obs;
//   var otp = ''.obs;
//   var isLoading = false.obs;
//
//   // Validate phone number (assuming 10 digits)
//   String? validatePhoneNumber(String value) {
//     if (value.length != 10 || !GetUtils.isNumericOnly(value)) {
//       return 'Enter a valid 10-digit phone number';
//     }
//     return null;
//   }
//
//   // Validate OTP (assuming 6 digits)
//   String? validateOtp(String value) {
//     if (value.length != 6 || !GetUtils.isNumericOnly(value)) {
//       return 'Enter a valid 6-digit OTP';
//     }
//     return null;
//   }
//
//   // Simulate sending OTP (you can integrate actual API)
//   void sendOtp() {
//     if (validatePhoneNumber(phoneNumber.value) != null) {
//       Get.snackbar('Error', 'Invalid phone number');
//       return;
//     }
//     isLoading.value = true;
//
//     Future.delayed(Duration(seconds: 2), () {
//       isLoading.value = false;
//       Get.to(() => OtpPage());
//       Get.toNamed('/otp'); // Navigate to OTP verification page
//     });
//   }
//
//   // Simulate verifying OTP
//   void verifyOtp() {
//     if (validateOtp(otp.value) != null) {
//       Get.snackbar('Error', 'Invalid OTP');
//       return;
//     }
//     isLoading.value = true;
//
//     Future.delayed(Duration(seconds: 2), () {
//       isLoading.value = false;
//       Get.snackbar('Success', 'OTP Verified');
//       Get.offNamed('/home'); // Navigate to Home page or Dashboard
//     });
//   }
// }
