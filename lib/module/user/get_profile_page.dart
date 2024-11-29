import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/module/user/update_profile_user.dart';

import '../../contantss/fixed_text_for_api.dart';
import '../../controller/employee_controllers/employee_get_profile_controller.dart';
import '../../theme_color/theme_color.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EmployeeGetProfileController _employeegetprofile =
        Get.put(EmployeeGetProfileController());

    return Scaffold(
      //backgroundColor: MyTheme.themecolor,
      body: SafeArea(
        child: Obx(
          () => (_employeegetprofile.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: size.height,
                  width: size.width,
                  color: MyTheme.themecolor,
                  child: Column(
                    children: [
                      Container(
                        //height: size.height * 0.29,
                        color: MyTheme.themecolor,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: AppColors.white,
                                      size: size.height * 0.024,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Text(
                                      "My Profile",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.white,
                                          fontSize: size.height * 0.024,
                                          fontWeight: FontWeight.w500),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(EditProfilePages());
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColors.white,
                                      size: size.height * 0.027,
                                    ),
                                  ),
                                ),
                                // Container(
                                //   width: 40,
                                // ),
                              ],
                            ),
                            Container(
                              height: size.height * 0.17,
                              width: size.width * 0.34,
                              decoration: BoxDecoration(
                                color: MyTheme.themecolor,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                              ),
                              child: _employeegetprofile.profileModelEmployeeGet
                                              ?.data?.employeePic !=
                                          null &&
                                      _employeegetprofile
                                          .profileModelEmployeeGet!
                                          .data!
                                          .employeePic!
                                          .isNotEmpty
                                  ? ClipOval(
                                      child: Image.network(
                                        "${FixedText.imgebaseurlvardan}${_employeegetprofile.profileModelEmployeeGet!.data!.employeePic}",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Center(
                                      child: Container(
                                      height: size.height * 0.16,
                                      width: size.width * 0.33,
                                      decoration: BoxDecoration(
                                        //color: MyTheme.themecolor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/play_store_512.png",
                                          ),
                                        ),
                                        border: Border.all(
                                            color: Colors.transparent,
                                            width: 0),
                                      ),
                                    )
                                      // Text(
                                      //   "No Image",
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      ),
                            )

                            ///
                            // Stack(
                            //   alignment: Alignment.center,
                            //   children: [
                            //     Container(
                            //       height: size.height * 0.17,
                            //       width: size.width * 0.34,
                            //       decoration: BoxDecoration(
                            //         color: MyTheme.themecolor,
                            //         shape: BoxShape.circle,
                            //         border:
                            //             Border.all(color: Colors.white, width: 3),
                            //         image: _employeegetprofile
                            //                         .profileModelEmployeeGet
                            //                         ?.data
                            //                         ?.employeePic !=
                            //                     null &&
                            //                 _employeegetprofile
                            //                     .profileModelEmployeeGet!
                            //                     .data!
                            //                     .employeePic!
                            //                     .isNotEmpty
                            //             ? DecorationImage(
                            //                 image: NetworkImage(
                            //                   "${FixedText.imgebaseurlvardan}${_employeegetprofile.profileModelEmployeeGet!.data!.employeePic}",
                            //                 ),
                            //                 fit: BoxFit.cover,
                            //               )
                            //             : null, // No image if employeePic is null or empty
                            //       ),
                            //     ),
                            //     if (_employeegetprofile.profileModelEmployeeGet
                            //                 ?.data?.employeePic ==
                            //             null ||
                            //         _employeegetprofile.profileModelEmployeeGet!
                            //             .data!.employeePic!.isEmpty)
                            //       Text(
                            //         "No Image",
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //   ],
                            // )

                            ///
                            // Container(
                            //   height: size.height * 0.17,
                            //   width: size.width * 0.34,
                            //   decoration: BoxDecoration(
                            //       color: MyTheme.themecolor,
                            //       shape: BoxShape.circle,
                            //       border:
                            //           Border.all(color: Colors.white, width: 3),
                            //       image: DecorationImage(
                            //         image: NetworkImage(
                            //           _employeegetprofile.profileModelEmployeeGet
                            //                           ?.data?.employeePic !=
                            //                       null &&
                            //                   _employeegetprofile
                            //                       .profileModelEmployeeGet!
                            //                       .data!
                            //                       .employeePic!
                            //                       .isNotEmpty
                            //               ? "${FixedText.imgebaseurlvardan}${_employeegetprofile.profileModelEmployeeGet!.data!.employeePic}"
                            //               : "https://via.placeholder.com/150", // Replace with your default image URL
                            //         ),
                            //         fit: BoxFit.cover,
                            //       )),
                            // ),
                            ,
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Employee ID: ',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  "${_employeegetprofile.profileModelEmployeeGet?.data?.id.toString()}",
                                  style: GoogleFonts.poppins(
                                    fontSize: size.height * 0.02,
                                    color: MyTheme.ambapp11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      PhysicalModel(
                        color: AppColors.th1wht2,
                        shadowColor: AppColors.greyColor,
                        clipBehavior: Clip.none,
                        elevation: 5,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Container(
                          height: size.height * 0.68,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: AppColors.th1wht2),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.account_circle,
                                    ), // Icon to display on the left side
                                    title: Text(
                                      'Name',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.black,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.employeeFirstName.toString()} "
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.employeeMiddleName.toString()} "
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.employeeLastName.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                                //Divider(),
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .email), // Icon to display on the left side
                                    title: Text(
                                      'Email',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.email.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .phone_android_outlined), // Icon to display on the left side
                                    title: Text(
                                      'Mobile No',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.mobileNumber.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                                // SizedBox(
                                //   height: size.height * 0.08,
                                //   child: ListTile(
                                //     leading: Icon(Icons
                                //         .perm_identity), // Icon to display on the left side
                                //     title: Text(
                                //       'UID',
                                //       style: GoogleFonts.poppins(
                                //         fontSize: size.height * 0.015,
                                //         color: AppColors.greyColor,
                                //       ),
                                //     ), // Title of the ListTile
                                //     subtitle: Text(
                                //       '45543433WE',
                                //       style: GoogleFonts.poppins(
                                //         fontSize: size.height * 0.02,
                                //         color: AppColors.black,
                                //       ),
                                //     ), // Subtitle of the ListTile
                                //     // trailing: Icon(Icons
                                //     //     .arrow_forward), // Icon to display on the right side
                                //     onTap: () {
                                //       // Function to execute when ListTile is tapped
                                //       print('Tapped on John Doe');
                                //     },
                                //   ),
                                // ),
                                // Container(
                                //   height: size.height * 0.0001,
                                //   color: AppColors.greyColor,
                                // ),
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .pin), // Icon to display on the left side
                                    title: Text(
                                      'PIN Code',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.pincode.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .real_estate_agent), // Icon to display on the left side
                                    title: Text(
                                      'State',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.stateName.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .location_city), // Icon to display on the left side
                                    title: Text(
                                      'City',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.cityName.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .pentagon_outlined), // Icon to display on the left side
                                    title: Text(
                                      'Department',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.employeeDepartment.toString()}",
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),

                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .pin_drop_sharp), // Icon to display on the left side
                                    title: Text(
                                      'Address',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.employeeCurrentAddress.toString()}",
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),

                                SizedBox(
                                  height: size.height * 0.08,
                                  child: ListTile(
                                    leading: Icon(Icons
                                        .emergency), // Icon to display on the left side
                                    title: Text(
                                      'Emergency Contact No:',
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.015,
                                        color: AppColors.greyColor,
                                      ),
                                    ), // Title of the ListTile
                                    subtitle: Text(
                                      "${_employeegetprofile.profileModelEmployeeGet?.data?.emergencyContactNumber.toString()}",
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.black,
                                      ),
                                    ), // Subtitle of the ListTile
                                    // trailing: Icon(Icons
                                    //     .arrow_forward), // Icon to display on the right side
                                    onTap: () {
                                      // Function to execute when ListTile is tapped
                                      print('Tapped on John Doe');
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),

                                // SizedBox(
                                //   height: size.height * 0.08,
                                //   child: ListTile(
                                //     leading: Icon(Icons
                                //         .electric_meter_sharp), // Icon to display on the left side
                                //     title: Text(
                                //       'Total Consumptions',
                                //       style: GoogleFonts.poppins(
                                //         fontSize: size.height * 0.015,
                                //         color: AppColors.greyColor,
                                //       ),
                                //     ), // Title of the ListTile
                                //     subtitle: Text(
                                //       '876656 Units',
                                //       maxLines: 2,
                                //       style: GoogleFonts.poppins(
                                //         fontSize: size.height * 0.02,
                                //         color: AppColors.black,
                                //       ),
                                //     ), // Subtitle of the ListTile
                                //     // trailing: Icon(Icons
                                //     //     .arrow_forward), // Icon to display on the right side
                                //     onTap: () {
                                //       // Function to execute when ListTile is tapped
                                //       print('Tapped on John Doe');
                                //     },
                                //   ),
                                // ),
                                Container(
                                  height: size.height * 0.0001,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
