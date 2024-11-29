// ChangePasswordController.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api_services/api_services_call.dart';
import '../../models/get_city_model.dart';
import '../../models/state_get_model.dart';
import '../../module/user/home_page.dart';
import 'employee_get_profile_controller.dart';

class UpdateProfileEmployeeController extends GetxController {
  final GlobalKey<FormState> updateProfileEmployeeFormKey =
      GlobalKey<FormState>();

  final EmployeeGetProfileController _employeegetprofile =
      Get.put(EmployeeGetProfileController());

  // Text Controllers
  late final TextEditingController employeeFirstNameController;
  late final TextEditingController employeeMiddleNameController;
  late final TextEditingController employeeLastNameController;
  late final TextEditingController mobileController;
  late final TextEditingController emailController;
  late final TextEditingController addressController;
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController =
      TextEditingController(); // Pincode controller
  late TextEditingController emergencyPhoneController =
      TextEditingController(); // Emergency Contact controller

  // Dropdown IDs for City and State
  final RxString selectedStateId = ''.obs;
  final RxString selectedCityId = ''.obs;

  // Loading indicator
  final RxBool isLoading = false.obs;

  // State and City lists
  // State and City lists (corrected types)
  RxList<StateModel> statesList = <StateModel>[].obs;
  RxList<CityModel> citiesList = <CityModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Initialize controllers with data
    employeeFirstNameController = TextEditingController(
        text: _employeegetprofile
                .profileModelEmployeeGet?.data?.employeeFirstName ??
            '');
    employeeMiddleNameController = TextEditingController(
        text: _employeegetprofile
                .profileModelEmployeeGet?.data?.employeeMiddleName ??
            '');
    employeeLastNameController = TextEditingController(
        text: _employeegetprofile
                .profileModelEmployeeGet?.data?.employeeLastName ??
            '');
    mobileController = TextEditingController(
        text: _employeegetprofile.profileModelEmployeeGet?.data?.mobileNumber ??
            '');
    emailController = TextEditingController(
        text: _employeegetprofile.profileModelEmployeeGet?.data?.email ?? '');
    addressController = TextEditingController(
        text: _employeegetprofile
                .profileModelEmployeeGet?.data?.employeeCurrentAddress ??
            '');
    emergencyPhoneController = TextEditingController(
        text: _employeegetprofile
                .profileModelEmployeeGet?.data?.emergencyContactNumber ??
            ''); // Emergency contact initialization

    // Initialize state, city, and pincode names in text fields
    stateController.text =
        _employeegetprofile.profileModelEmployeeGet?.data?.stateName ?? '';
    cityController.text =
        _employeegetprofile.profileModelEmployeeGet?.data?.cityName ?? '';
    pincodeController.text =
        "${_employeegetprofile.profileModelEmployeeGet?.data?.pincode ?? ''}"; // Pincode text field

    // Store the selected IDs (if any)
    selectedStateId.value =
        "${_employeegetprofile.profileModelEmployeeGet?.data?.stateId ?? ''}";
    selectedCityId.value =
        "${_employeegetprofile.profileModelEmployeeGet?.data?.cityId ?? ''}";

    // Fetch states and cities on init
    fetchStates();
  }

// Fetch States API in your controller
  Future<void> fetchStates() async {
    try {
      final stateModel = await ApiProvider().getStates();

      if (stateModel.succeeded == true) {
        statesList.value = stateModel.data ?? [];
      } else {
        showSnackbar('Error', stateModel.message ?? 'Failed to fetch states.',
            Colors.red);
      }
    } catch (e) {
      print("Error in fetchStates: $e");
      showSnackbar(
          'Error', 'Failed to fetch states. Please try again.', Colors.red);
    }
  }

// Fetch Cities by StateId API in your controller
  Future<void> fetchCities(String stateId) async {
    try {
      final cityModel =
          await ApiProvider().getCitiesByStateId(int.parse(stateId));
      if (cityModel.succeeded == true) {
        citiesList.value = cityModel.data ?? [];
      } else {
        Get.snackbar(
          'Error',
          cityModel.message ?? 'Failed to fetch cities.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch cities. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  ///todo...

  Future<void> updateProfileApi(BuildContext context) async {
    try {
      isLoading.value = true;

      final response = await ApiProvider.updateProfileEmployeeApi(
        context,
        employeeFirstNameController.text.trim(),
        employeeMiddleNameController.text.trim(),
        employeeLastNameController.text.trim(),
        emailController.text.trim(),
        mobileController.text.trim(),
        addressController.text.trim(),
        selectedStateId.value, // Send State ID
        selectedCityId.value, // Send City ID
        pincodeController.text.trim(), // Send Pincode independently
        emergencyPhoneController.text.trim(), // Send Emergency Contact
      );

      if (response?.statusCode == 200) {
        // Navigate to Home Page
        Get.off(() => HomePage());

        // Success message
        Get.snackbar(
          'Success',
          'Profile updated successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        // Error message
        Get.snackbar(
          'Error',
          response?.body ?? 'Failed to update profile. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle unexpected errors
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void onStateSelected(String? stateId, String stateName) {
    selectedStateId.value = stateId ?? '';
    stateController.text = stateName;
    // Clear city if state changes
    selectedCityId.value = '';
    cityController.clear();
    fetchCities(stateId ?? ''); // Fetch cities for the selected state
  }

  void onCitySelected(String? cityId, String cityName) {
    selectedCityId.value = cityId ?? '';
    cityController.text = cityName;
  }

  @override
  void onClose() {
    employeeFirstNameController.dispose();
    employeeMiddleNameController.dispose();
    employeeLastNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    stateController.dispose();
    cityController.dispose();
    pincodeController.dispose(); // Dispose the pincode controller
    emergencyPhoneController
        .dispose(); // Dispose the emergency phone controller
    super.onClose();
  }

  ///custom snackbar,.....
  void showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

///

// class UpdateProfileEmployeeController extends GetxController {
//   final GlobalKey<FormState> updateProfileEmployeeFormKey =
//       GlobalKey<FormState>();
//
//   final EmployeeGetProfileController _employeegetprofile =
//       Get.put(EmployeeGetProfileController());
//   // Text Controllers
//   late final TextEditingController employeeFirstNameController;
//   late final TextEditingController employeeMiddleNameController;
//   late final TextEditingController employeeLastNameController;
//   late final TextEditingController mobileController;
//   late final TextEditingController emailController;
//   late final TextEditingController addressController;
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController pincodeController =
//       TextEditingController(); // Pincode controller
//   late TextEditingController emergencyPhoneController =
//       TextEditingController(); // Emergency Contact controller
//
//   // Dropdown IDs for City and State
//   final RxString selectedStateId = ''.obs;
//   final RxString selectedCityId = ''.obs;
//
//   // Loading indicator
//   final RxBool isLoading = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Initialize controllers with data
//     employeeFirstNameController = TextEditingController(
//         text: _employeegetprofile
//                 .profileModelEmployeeGet?.data?.employeeFirstName ??
//             '');
//     employeeMiddleNameController = TextEditingController(
//         text: _employeegetprofile
//                 .profileModelEmployeeGet?.data?.employeeMiddleName ??
//             '');
//     employeeLastNameController = TextEditingController(
//         text: _employeegetprofile
//                 .profileModelEmployeeGet?.data?.employeeLastName ??
//             '');
//     mobileController = TextEditingController(
//         text: _employeegetprofile.profileModelEmployeeGet?.data?.mobileNumber ??
//             '');
//     emailController = TextEditingController(
//         text: _employeegetprofile.profileModelEmployeeGet?.data?.email ?? '');
//     addressController = TextEditingController(
//         text: _employeegetprofile
//                 .profileModelEmployeeGet?.data?.employeeCurrentAddress ??
//             '');
//     emergencyPhoneController = TextEditingController(
//         text: _employeegetprofile
//                 .profileModelEmployeeGet?.data?.emergencyContactNumber ??
//             ''); // Emergency contact initialization
//
//     // Initialize state, city, and pincode names in text fields
//     stateController.text =
//         _employeegetprofile.profileModelEmployeeGet?.data?.stateName ?? '';
//     cityController.text =
//         _employeegetprofile.profileModelEmployeeGet?.data?.cityName ?? '';
//     pincodeController.text =
//         "${_employeegetprofile.profileModelEmployeeGet?.data?.pincode ?? ''}"; // Pincode text field
//
//     // Store the selected IDs (if any)
//     selectedStateId.value =
//         "${_employeegetprofile.profileModelEmployeeGet?.data?.stateId ?? ''}";
//     selectedCityId.value =
//         "${_employeegetprofile.profileModelEmployeeGet?.data?.cityId ?? ''}";
//   }
//
//   Future<void> updateProfileApi(BuildContext context) async {
//     try {
//       isLoading.value = true;
//
//       final response = await ApiProvider.updateProfileEmployeeApi(
//         context,
//         employeeFirstNameController.text.trim(),
//         employeeMiddleNameController.text.trim(),
//         employeeLastNameController.text.trim(),
//         emailController.text.trim(),
//         mobileController.text.trim(),
//         addressController.text.trim(),
//         selectedStateId.value, // Send State ID
//         selectedCityId.value, // Send City ID
//         //cityController.text.trim(),
//         pincodeController.text.trim(), // Send Pincode independently
//         emergencyPhoneController.text.trim(), // Send Emergency Contact
//       );
//
//       if (response?.statusCode == 200) {
//         // Navigate to Home Page
//         Get.off(() => HomePage());
//
//         // Success message
//         Get.snackbar(
//           'Success',
//           'Profile updated successfully!',
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         // Error message
//         Get.snackbar(
//           'Error',
//           response?.body ?? 'Failed to update profile. Please try again.',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       // Handle unexpected errors
//       Get.snackbar(
//         'Error',
//         'An unexpected error occurred. Please try again.',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void onStateSelected(String? stateId, String stateName) {
//     selectedStateId.value = stateId ?? '';
//     stateController.text = stateName;
//     // Clear city if state changes
//     selectedCityId.value = '';
//     cityController.clear();
//   }
//
//   void onCitySelected(String? cityId, String cityName) {
//     selectedCityId.value = cityId ?? '';
//     cityController.text = cityName;
//     // Do not set pincode when city is selected
//   }
//
//   @override
//   void onClose() {
//     employeeFirstNameController.dispose();
//     employeeMiddleNameController.dispose();
//     employeeLastNameController.dispose();
//     mobileController.dispose();
//     emailController.dispose();
//     addressController.dispose();
//     stateController.dispose();
//     cityController.dispose();
//     pincodeController.dispose(); // Dispose the pincode controller
//     emergencyPhoneController
//         .dispose(); // Dispose the emergency phone controller
//     super.onClose();
//   }
// }
