import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Make sure to import this for date formatting

class TripFormController extends GetxController {
  var empId = ''.obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  var selectedTripType = ''.obs;
  var selectedShift = ''.obs;
  var selectedFacility = ''.obs;
  var selectedPickupShift = ''.obs;
  var selectedDropShift = ''.obs;

  List<String> tripTypes = ['Business', 'Leisure', 'Emergency'];
  List<String> shifts = ['Morning', 'Afternoon', 'Night'];
  List<String> facilities = ['Facility A', 'Facility B', 'Facility C'];

  Future<void> selectStartDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      startDate.value = date;
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      endDate.value = date;
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date); // Adjust format as needed
  }
}
