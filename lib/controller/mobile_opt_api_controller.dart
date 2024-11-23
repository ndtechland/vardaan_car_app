import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vardaancar/api_services/api_services_call.dart';

import '../module/driver/home_page_driver.dart';
import '../module/user/home_page.dart';

class LoginWithOtpController extends GetxController {
  var isLoading = false.obs;

  final ApiProvider apiProvider = ApiProvider();

  Future<void> verifyOtp(String mobileNumber, String otp) async {
    isLoading.value = true;
    try {
      final response = await apiProvider.verifyOtpOrPassword(mobileNumber, otp);

      if (response['Status'] == 200) {
        // Save necessary data in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('id', response['Data']['Id']);
        prefs.setString('mobileNumber', response['Data']['MobileNumber']);
        prefs.setBool('isFirst', response['Data']['IsFirst']);
        prefs.setString('role', response['Role']);

        int? id = prefs.getInt('id');
        if (id != null) {
          print("User ID: $id");
        } else {
          print("User ID not found!");
        }

        // Navigate based on role and IsFirst status
        if (response['Data']['IsFirst'] == false) {
          if (response['Role'] == 'Driver') {
            Get.offAll(() => HomePageDriver());
          } else {
            Get.offAll(() => HomePage());
          }
        } else {
          Get.offAll(() => HomePage()); // Redirect to default home page
        }
      } else {
        Get.snackbar('Error', response['Message']);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
