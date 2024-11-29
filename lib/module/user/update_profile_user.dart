import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/controller/update_profile_controller.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_buttom.dart';
import '../../contantss/textfield_constant/textfield_reuse.dart';
import '../../controller/driver_controller/profile_controller_driver.dart';
import '../../controller/employee_controllers/edit_profile_employee_controller.dart';
import '../../theme_color/theme_color.dart';

class EditProfilePages extends StatelessWidget {
  // final GlobalKey<FormState> _formconnectionKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyemp = GlobalKey<FormState>();

  Update_profile _update_profile = Get.put(Update_profile());
  ProfileController _profileController = Get.put(ProfileController());
  UpdateProfileEmployeeController _profileEmployeeController =
      Get.put(UpdateProfileEmployeeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _profileEmployeeController.updateProfileEmployeeFormKey,
      backgroundColor: AppColors.white,
      appBar: myAppBar(
        //backgroundColor: AppColors.white,
        title: 'Update Profile',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
        searchIcon: null,
        onSearchPressed: () {
          /// Handle search icon press
        },
        userIcon: null,
        onUserPressed: () {
          //cscsscs
          //cmdslcm
          // Handle user icon press
          ///todo:application.....
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKeyemp,
            //_profileEmployeeController.updateProfileEmployeeFormKey,

            //_formconnectionKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.0,
                ),
                SizedBox(height: size.height * 0.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'Name',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                        //color: Colors.red
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    readOnly: true,
                    controller:
                        _profileEmployeeController.employeeFirstNameController,
                    obscureText: false,
                    hintText: 'Enter Your Name',
                    keyboardType: TextInputType.text,
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///todo:......................................
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    readOnly: true,
                    controller: _profileEmployeeController.emailController,
                    obscureText: false,
                    hintText: 'Enter Email',
                    keyboardType: TextInputType.text,
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.email,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'Phone Number',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.005,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    readOnly: true,
                    controller: _profileEmployeeController.mobileController,
                    obscureText: false,
                    hintText: 'Enter Phone',
                    keyboardType: TextInputType.text,
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.phone_android_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'State',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                // State Dropdown
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 1),
                    child: DropdownButtonFormField<String>(
                      value: _profileEmployeeController
                              .selectedStateId.value.isNotEmpty
                          ? _profileEmployeeController.selectedStateId.value
                          : null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyTheme
                            .themecolor, // Background color for the field
                        prefixIcon: Icon(
                          Icons
                              .location_on, // Icon for State (choose appropriate one)
                          color: MyTheme.logored, // Prefix icon color
                        ),
                        // labelText: 'State',
                        labelStyle:
                            TextStyle(color: Colors.white), // Label text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: MyTheme.themecolor, // Border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Colors.transparent, // Focused border color
                            width: 2.0,
                          ),
                        ),
                      ),
                      dropdownColor: MyTheme
                          .themecolor, // Background color for the dropdown menu
                      style: TextStyle(
                        color: Colors
                            .white, // Set the selected text color to white
                      ),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          _profileEmployeeController.onStateSelected(
                            newValue,
                            _profileEmployeeController.statesList
                                .firstWhere(
                                    (state) => state.id == int.parse(newValue))
                                .stateName!,
                          );
                        }
                      },
                      items: _profileEmployeeController.statesList.map((state) {
                        return DropdownMenuItem<String>(
                          value: state.id.toString(),
                          child: Text(
                            state.stateName!,
                            style: TextStyle(
                              color: Colors
                                  .white, // Text color inside dropdown list
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),

                ///
                // Obx(() {
                //   return DropdownButtonFormField<String>(
                //     value: _profileEmployeeController
                //             .selectedStateId.value.isNotEmpty
                //         ? _profileEmployeeController.selectedStateId.value
                //         : null,
                //     decoration: InputDecoration(
                //       labelText: 'State',
                //       border: OutlineInputBorder(),
                //     ),
                //     onChanged: (newValue) {
                //       if (newValue != null) {
                //         _profileEmployeeController.onStateSelected(
                //             newValue,
                //             _profileEmployeeController.statesList
                //                 .firstWhere(
                //                     (state) => state.id == int.parse(newValue))
                //                 .stateName!);
                //       }
                //     },
                //     items: _profileEmployeeController.statesList.map((state) {
                //       return DropdownMenuItem<String>(
                //         value: state.id.toString(),
                //         child: Text(state.stateName!),
                //       );
                //     }).toList(),
                //   );
                // }),

                SizedBox(height: 10),

                ///
                // Directionality(
                //   textDirection: TextDirection.ltr,
                //   child: CustomTextField(
                //     controller: _profileEmployeeController.stateController,
                //     obscureText: false,
                //     hintText: 'Select State',
                //     keyboardType: TextInputType.text,
                //     prefixIcon: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //           child: Icon(
                //             Icons.real_estate_agent,
                //             color: Colors.red,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'City',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),

                // DropdownButtonFormField<String>(
                //   value: selectedStateId.value.isNotEmpty ? selectedStateId.value : null,
                //   decoration: InputDecoration(labelText: 'Select State'),
                //   items: stateList.map((state) {
                //     return DropdownMenuItem(
                //       value: state.id,
                //       child: Text(state.name),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     final selectedState = stateList.firstWhere((state) => state.id == value);
                //     controller.onStateSelected(selectedState.id, selectedState.name);
                //   },
                // ),
                ///state..
                // DropdownButtonFormField<String>(
                //   value: selectedCityId.value.isNotEmpty ? selectedCityId.value : null,
                //   decoration: InputDecoration(labelText: 'Select City'),
                //   items: cityList.map((city) {
                //     return DropdownMenuItem(
                //       value: city.id,
                //       child: Text(city.name),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     final selectedCity = cityList.firstWhere((city) => city.id == value);
                //     controller.onCitySelected(selectedCity.id, selectedCity.name, selectedCity.pincode);
                //   },
                // ),

                ///
                ///
                // City Dropdown
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Obx(() {
                    return DropdownButtonFormField<String>(
                      value: _profileEmployeeController
                              .selectedCityId.value.isNotEmpty
                          ? _profileEmployeeController.selectedCityId.value
                          : null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyTheme
                            .themecolor, // Background color for the field
                        prefixIcon: Icon(
                          Icons
                              .location_city, // Icon for State (choose appropriate one)
                          color: MyTheme.logored, // Prefix icon color
                        ),
                        // labelText: 'State',
                        labelStyle:
                            TextStyle(color: Colors.white), // Label text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: MyTheme.themecolor, // Border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Colors.transparent, // Focused border color
                            width: 2.0,
                          ),
                        ),
                      ),
                      dropdownColor: MyTheme
                          .themecolor, // Background color for the dropdown menu
                      onChanged: (newValue) {
                        if (newValue != null) {
                          _profileEmployeeController.onCitySelected(
                            newValue,
                            _profileEmployeeController.citiesList
                                .firstWhere(
                                    (city) => city.id == int.parse(newValue))
                                .cityName!,
                          );
                        }
                      },
                      style: TextStyle(
                        color: Colors
                            .white, // Set the selected text color to white
                      ),
                      items: _profileEmployeeController.citiesList.map((city) {
                        return DropdownMenuItem<String>(
                          value: city.id.toString(),
                          child: Text(
                            city.cityName!,
                            style: TextStyle(
                              color: Colors.white, // Text color inside dropdown
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ),

                ///

                // Directionality(
                //   textDirection: TextDirection.ltr,
                //   child:
                //   CustomTextField(
                //     controller: _profileEmployeeController.cityController,
                //     obscureText: false,
                //     hintText: 'Select City',
                //     keyboardType: TextInputType.number,
                //     prefixIcon: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //           child: Icon(
                //             Icons.pin_drop_sharp,
                //             color: Colors.red,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'PinCode',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    controller: _profileEmployeeController.pincodeController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pincode is required';
                      }
                      if (value.length != 6 ||
                          !RegExp(r'^\d{6}$').hasMatch(value)) {
                        return 'Enter a valid 6-digit pincode';
                      }
                      return null; // Valid input
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Only digits allowed
                      LengthLimitingTextInputFormatter(6), // Limit to 10 digits
                    ],
                    hintText: 'Enter PinCode',
                    keyboardType: TextInputType.number,
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.pin,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'Address',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    controller: _profileEmployeeController.addressController,
                    obscureText: false,
                    hintText: 'Enter Your Address',
                    keyboardType: TextInputType.text,
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.pin_drop_sharp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      'Emergency Contact No.',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.027,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    controller:
                        _profileEmployeeController.emergencyPhoneController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "Emergency contact is required",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return ''; // Return an empty string to indicate validation failure
                      }
                      if (value.length != 10 ||
                          !RegExp(r'^\d{10}$').hasMatch(value)) {
                        Fluttertoast.showToast(
                          msg: "Enter a valid 10-digit contact number",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return ''; // Return an empty string to indicate validation failure
                      }
                      return null; // Valid input
                    },
                    hintText: 'Enter Emergency Contact No.',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Restrict input to digits
                      LengthLimitingTextInputFormatter(
                          10), // Restrict to 10 digits max
                    ],
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.emergency,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.00,
                ),
                SizedBox(height: 14),
                // Obx(() {
                //   return _profileEmployeeController.isLoading.value
                //       ? Center(child: CircularProgressIndicator())
                //       : HorizontalButton(
                //           text: 'Update',
                //           onClick: () {
                //             print("clickkkk");
                //             _profileEmployeeController
                //                 .updateProfileApi(context);
                //
                //             ///
                //             // if (_profileEmployeeController
                //             //     .updateProfileEmployeeFormKey.currentState!
                //             //     .validate()) {
                //             //   _profileEmployeeController
                //             //       .updateProfileApi(context);
                //             // }
                //           },
                //         );
                // }),

                Obx(() {
                  return _profileEmployeeController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : HorizontalButton(
                          text: 'Update',
                          onClick: () {
                            if (_formKeyemp
                                // _profileEmployeeController
                                //     .updateProfileEmployeeFormKey
                                .currentState!
                                .validate()) {
                              _profileEmployeeController
                                  .updateProfileApi(context);
                            }
                          },
                        );
                }),

                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
