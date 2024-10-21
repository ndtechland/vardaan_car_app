import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme_color/theme_color.dart';
import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_buttom.dart';
import '../../controller/book_trip_controller.dart';

class TripFormPage extends StatelessWidget {
  final TripFormController tripformcontroller = Get.put(TripFormController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(
        title: 'Book Trip',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/car3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Facility Selection
                  _buildSectionHeader(size, 'Select Facility'),
                  Container(
                    width: double.infinity,
                    child: _buildDropdownField(
                      context,
                      'Select Facility',
                      tripformcontroller.selectedFacility,
                      tripformcontroller.facilities,
                    ),
                  ),

                  // Start Date Selection
                  _buildSectionHeader(size, 'Select Start Date'),
                  GestureDetector(
                    onTap: () => tripformcontroller.selectStartDate(context),
                    child: Obx(() => _buildDatePickerField(
                          context,
                          'Start Date',
                          tripformcontroller.startDate.value,
                        )),
                  ),

                  // Shift and Trip Type Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionHeader(size, 'Select Shift Type'),
                      _buildSectionHeader(size, 'Select Trip Type'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropdownField(
                        context,
                        'Select Shift Type',
                        tripformcontroller.selectedShift,
                        tripformcontroller.shifts,
                      ),
                      _buildDropdownField(
                        context,
                        'Select Trip Type',
                        tripformcontroller.selectedTripType,
                        tripformcontroller.tripTypes,
                      ),
                    ],
                  ),

                  // End Date Selection
                  _buildSectionHeader(size, 'Select End Date'),
                  GestureDetector(
                    onTap: () => tripformcontroller.selectEndDate(context),
                    child: Obx(() => _buildDatePickerField(
                          context,
                          'End Date',
                          tripformcontroller.endDate.value,
                        )),
                  ),

                  // Pickup and Drop Shift Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionHeader(size, 'Select Pickup Shift'),
                      _buildSectionHeader(size, 'Select Drop Shift'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropdownField(
                        context,
                        'Pickup Shift',
                        tripformcontroller.selectedPickupShift,
                        tripformcontroller.shifts,
                      ),
                      _buildDropdownField(
                        context,
                        'Drop Shift',
                        tripformcontroller.selectedDropShift,
                        tripformcontroller.shifts,
                      ),
                    ],
                  ),

                  // Book Button
                  SizedBox(height: 35),
                  Align(
                    alignment: Alignment.center,
                    child: HorizontalButton(
                      text: 'Book',
                      onClick: () {
                        Get.back();
                        print('Container clicked!');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(Size size, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: size.height * 0.015,
        ),
      ),
    );
  }

  Widget _buildDatePickerField(
      BuildContext context, String label, DateTime? date) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: MyTheme.themecolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                date != null
                    ? '$label: ${tripformcontroller.formatDate(date)}'
                    : 'Select $label',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.calendar_today,
              color: Colors.white, // Change color to match your theme
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String hint,
      RxString selectedValue, List<String> items) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: MyTheme.themecolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(() => DropdownButton<String>(
              hint: Text(hint, style: TextStyle(color: Colors.white)),
              value:
                  selectedValue.value.isNotEmpty ? selectedValue.value : null,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedValue.value = newValue; // Update the RxString
                }
              },
              dropdownColor: MyTheme.themecolor,
              style: TextStyle(color: Colors.white),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
            )),
      ),
    );
  }
}
