import 'dart:async';

import 'package:get/get.dart';

import '../../api_services/api_services_call.dart';
import '../../models/driver_model/driver_banner.dart';

class BannerController extends GetxController {
  RxBool isLoading = true.obs;

  BannerDriver? bannerDriver;

  Future<void> BannersApi() async {
    isLoading(true);
    bannerDriver = await ApiProvider.fetchBanners();

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
      bannerDriver = await ApiProvider.fetchBanners();
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
