import 'dart:async';

import 'package:get/get.dart';
import 'package:vardaancar/controller/driver_controller/profile_controller_driver.dart';

import '../../api_services/api_services_call.dart';
import '../../models/driver_model/driver_banner.dart';
import '../employee_controllers/employee_get_profile_controller.dart';

class BannerController extends GetxController {
  RxBool isLoading = true.obs;

  ProfileController _driverprofileController = Get.put(ProfileController());
  EmployeeGetProfileController _employeegetprofile =
      Get.put(EmployeeGetProfileController());

  BannerDriver? bannerDriver;

  Future<void> BannersApi() async {
    isLoading(true);
    // Get roles from both sources
    var roleFromDriver =
        _driverprofileController?.getdriverprofileModel?.role?.toString();
    var roleFromEmployee =
        _employeegetprofile.profileModelEmployeeGet?.role?.toString();

// Print both roles
    print('Role from driver profile: $roleFromDriver');
    print('Role from employee profile: $roleFromEmployee');

// Use the fallback logic to assign the final role
    var role = roleFromDriver ?? roleFromEmployee ?? 'Employee';

// Print the final assigned role
    print('Assigned role: $role');

    ///
    bannerDriver = await ApiProvider.fetchBannersdriver(
        // role
        );

    if (bannerDriver?.data == null) {
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
      bannerDriver = await ApiProvider.fetchBannersdriver(
          //role
          );
    }
    if (bannerDriver?.data != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    BannersApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
