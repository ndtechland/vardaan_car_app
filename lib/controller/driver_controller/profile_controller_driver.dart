import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../api_services/api_services_call.dart';
import '../../models/driver_model/GetProfileModel.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> formKeyProfile = GlobalKey<FormState>();

  RxBool isLoading = true.obs;

  // RxString cvUrl = ''.obs;

  ProfileModelDriverGet? getdriverprofileModel;

  Future<void> driverprofileApi() async {
    isLoading(true);
    getdriverprofileModel = await ApiProvider.GetDriverProfileApi();

    if (getdriverprofileModel?.data?.mobileNumber == null) {
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
      getdriverprofileModel = await ApiProvider.GetDriverProfileApi();
    }
    if (getdriverprofileModel?.data?.mobileNumber != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    driverprofileApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
