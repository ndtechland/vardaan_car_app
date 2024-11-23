import 'dart:async';

import 'package:get/get.dart';
import 'package:vardaancar/api_services/api_services_call.dart';

import '../../models/employee_model/employee_grt_profile_model.dart';

class EmployeeGetProfileController extends GetxController {
  RxBool isLoading = true.obs;

  ProfileModelEmployeeGet? profileModelEmployeeGet;

  Future<void> employeeprofileApi() async {
    isLoading(true);
    profileModelEmployeeGet = await ApiProvider.GetEmployeeProfileApi();

    if (profileModelEmployeeGet?.data?.mobileNumber == null) {
      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(true);
      profileModelEmployeeGet = await ApiProvider.GetEmployeeProfileApi();
    }
    if (profileModelEmployeeGet?.data?.mobileNumber != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    employeeprofileApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
