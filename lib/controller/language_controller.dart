import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  var selectedLocale = 'en'.obs; // Reactive variable

  final GetStorage storage = GetStorage(); // Storage to persist the locale

  @override
  void onInit() {
    super.onInit();
    // Load the saved locale if it exists
    String? storedLocale = storage.read('locale');
    if (storedLocale != null) {
      selectedLocale.value = storedLocale;
      Get.updateLocale(Locale(storedLocale));
    }
  }

  // Update the locale and save it to storage
  void updateLocale(String newLocale) {
    selectedLocale.value = newLocale;
    Get.updateLocale(Locale(newLocale));
    storage.write('locale', newLocale); // Persist the locale
  }
}
