import 'dart:async';

import 'package:get/get.dart';
import 'package:vardaancar/api_services/api_services_call.dart';

import '../models/contact_us_model.dart';

class ContactUsGetController extends GetxController {
  RxBool isLoading = true.obs;

  GetContactUsModel? getContactUsModel;

  Future<void> contactusApi() async {
    isLoading(true);
    getContactUsModel = await ApiProvider.GetContactUSApi();

    if (getContactUsModel?.data!.id == null) {
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
      getContactUsModel = await ApiProvider.GetContactUSApi();
    }
    if (getContactUsModel?.data!.id != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    contactusApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
