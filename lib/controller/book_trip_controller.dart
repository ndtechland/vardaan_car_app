import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Make sure to import this for date formatting

import '../api_services/api_services_call.dart';
import '../models/employee_model/bookin_request_model/get_drop_shift_time_model.dart';
import '../models/employee_model/bookin_request_model/get_pickup_shift_time_model.dart';
import '../models/employee_model/bookin_request_model/get_shift_type_model.dart';
import '../models/employee_model/bookin_request_model/trip_type_model.dart';
import 'employee_controllers/employee_get_profile_controller.dart';

class TripFormController extends GetxController {
  var isLoading = false.obs;

  EmployeeGetProfileController _employeegetprofile =
      Get.put(EmployeeGetProfileController());

  var empId = ''.obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  var selectedTripType = ''.obs;
  var selectedTripTypeId = 0.obs;
  var selectedShift = ''.obs;
  var selectedShiftId = 0.obs;
  var selectedFacility = ''.obs;
  var selectedPickupShift = ''.obs;
  var selectedPickupShiftId = 0.obs;
  var selectedDropShift = ''.obs;
  var selectedDropShiftId = 0.obs;
  var tripTypes = [].obs;
  var shifts = [].obs;
  var dropShifts = [].obs;
  var pickupShifts = [].obs;
  List<String> facilities = ['Normal', 'Single', 'Facility C'];
  GetTripTypeModel? getTripTypeModel;
  GetShiftTypeModel? getShiftTypeModel;
  GetPickupShiftTimeModel? getPickupShiftTimeModel;
  GetDropShiftTimeModel? getDropShiftTimeModel;

  Future<void> fetchTripTypes() async {
    isLoading.value = true;
    try {
      getTripTypeModel = await ApiProvider.getTripType();
      if (getTripTypeModel != null && getTripTypeModel?.succeeded == true) {
        // Map the API data to the tripTypes list
        tripTypes.value = getTripTypeModel?.data ?? [];
        // tripTypes = getTripTypeModel?.data?.map((e) => e.tripTypeName ?? '').toList() ?? [];
        // selectedTripTypeId.value = apiResponse.data?.isNotEmpty == true
        //     ? apiResponse.data!.first.id ?? 0
        //     : 0;
        //
        // print("Trip Types: $tripTypes");
        // print("Selected Trip Type ID: $selectedTripTypeId");
        update(); // Notify UI to refresh the tripTypes list
      } else {
        print('Error: ${getTripTypeModel?.message}');
      }
    } catch (e) {
      print('Error fetching trip types: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectTripType(int id) {
    selectedTripTypeId.value = id;
  }

  Future<void> fetchShiftTypes() async {
    isLoading.value = true;
    try {
      getShiftTypeModel = await ApiProvider.getShiftType();
      if (getShiftTypeModel != null && getShiftTypeModel?.succeeded == true) {
        // Map the API data to the tripTypes list
        shifts.value = getShiftTypeModel?.data ?? [];

        // shifts = apiResponse.data?.map((e) => e.tripName ?? '').toList() ?? [];

        update(); // Notify UI to refresh the tripTypes list
      } else {
        print('Error: ${getShiftTypeModel?.message}');
      }
    } catch (e) {
      print('Error fetching trip types: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectShiftType(int id) {
    selectedShiftId.value = id;
  }

  Future<void> fetchPickupShiftTime() async {
    isLoading.value = true;
    try {
      getPickupShiftTimeModel = await ApiProvider.getPickupShiftTime();
      if (getPickupShiftTimeModel != null &&
          getPickupShiftTimeModel?.succeeded == true) {
        // Map the API data to the tripTypes list
        pickupShifts.value = getPickupShiftTimeModel?.data ?? [];

        // pickupShifts = apiResponse.data?.map((e) => e.shiftTime ?? '').toList() ?? [];

        update(); // Notify UI to refresh the tripTypes list
      } else {
        print('Error: ${getPickupShiftTimeModel?.message}');
      }
    } catch (e) {
      print('Error fetching trip types: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectPickupTime(int id) {
    selectedPickupShiftId.value = id;
  }

  Future<void> fetchDropShiftTime() async {
    isLoading.value = true;
    try {
      getDropShiftTimeModel = await ApiProvider.getDropShiftTime();
      if (getDropShiftTimeModel != null &&
          getDropShiftTimeModel?.succeeded == true) {
        // Map the API data to the tripTypes list
        dropShifts.value = getDropShiftTimeModel?.data ?? [];

        // dropShifts = apiResponse.data?.map((e) => e.shiftTime ?? '').toList() ?? [];

        update(); // Notify UI to refresh the tripTypes list
      } else {
        print('Error: ${getDropShiftTimeModel?.message}');
      }
    } catch (e) {
      print('Error fetching trip types: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectDropTime(int id) {
    selectedDropShiftId.value = id;
  }

  Future<void> sendBookTripApi() async {
    try {
      isLoading.value = true;
      final response = await ApiProvider.bookTrip(
          "${_employeegetprofile.profileModelEmployeeGet?.data?.employeeId}",
          "${_employeegetprofile.profileModelEmployeeGet?.data?.companyId}",
          selectedShiftId.value,
          selectedTripTypeId.value,
          startDate.value.toString(),
          endDate.value.toString(),
          selectedPickupShiftId.value,
          selectedDropShiftId.value);
      print("response request ${response?.body}");
    } catch (e) {
      print('Error during check-in: $e');
    } finally {
      // Set loading state to false after the API call completes
      isLoading.value = false;
    }
  }

  // Future<void> selectStartDate(BuildContext context) async {
  //   DateTime? date = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(new Duration(days: 30)),
  //   );
  //   if (date != null) {
  //     startDate.value = date;
  //   }
  // }
  ///
  Future<void> selectStartDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (date != null) {
      startDate.value = date;
      // Reset the endDate if it is before the new startDate
      if (endDate.value!.isBefore(date)) {
        endDate.value = date;
      }
    }
  }

  // Future<void> selectEndDate(BuildContext context) async {
  //   DateTime? date = await showDatePicker(
  //     context: context,
  //     initialDate: startDate.value,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(new Duration(days: 30)),
  //   );
  //   if (date != null) {
  //     endDate.value = date;
  //   }
  // }
  ///
  Future<void> selectEndDate(BuildContext context) async {
    if (startDate.value == null) {
      // Ensure startDate is set before selecting endDate
      Get.snackbar('Error', 'Please select a start date first.');
      return;
    }

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: startDate.value!, // Use non-null value with !
      firstDate: startDate.value!, // Ensure endDate starts from startDate
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (date != null) {
      endDate.value = date;
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d MMM y').format(date); // Adjust format as needed
  }
}
