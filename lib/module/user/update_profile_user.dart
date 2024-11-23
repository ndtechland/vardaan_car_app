import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/controller/update_profile_controller.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_buttom.dart';
import '../../contantss/handle_image_selection/image_selection.dart';
import '../../contantss/textfield_constant/textfield_reuse.dart';
import '../../controller/driver_controller/profile_controller_driver.dart';
import '../../theme_color/theme_color.dart';

class EditProfilePages extends StatelessWidget {
  final GlobalKey<FormState> _formconnectionKey = GlobalKey<FormState>();
  Update_profile _update_profile = Get.put(Update_profile());
  ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            key: _formconnectionKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),

                ///todo:scscsacs

                ///SizedBox(height: size.height * 0.04),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       ///
                //       Container(
                //         height: size.height * 0.12,
                //         width: size.width * 0.32,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           border:
                //               Border.all(color: MyTheme.themecolor, width: 2),
                //         ),
                //         child: GestureDetector(
                //           onTap: handleImageSelection1,
                //           child: Obx(
                //             () => _update_profile.selectedPath.value != ''
                //                 ? Image.file(
                //                     File(_update_profile.selectedPath.value))
                //                 : Center(
                //                     child: Icon(Icons.camera_enhance_rounded),
                //                   ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: handleImageSelection1,
                          child: Obx(
                            () => selectionController.selectedPath.value != ''
                                ? PhysicalModel(
                                    color: AppColors.white,
                                    shadowColor: Colors.black,
                                    shape: BoxShape.circle, // Circular shape
                                    elevation: 5,
                                    child: Container(
                                      height: size.height *
                                          0.13, // Ensure width and height are equal for circle
                                      width: size.height * 0.13,
                                      decoration: BoxDecoration(
                                        shape:
                                            BoxShape.circle, // Circular shape
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.g3,
                                            spreadRadius: 1,
                                            blurRadius: 0,
                                            offset: Offset(0, 0),
                                          ),
                                          BoxShadow(
                                            color: AppColors.a1,
                                            spreadRadius: 0,
                                            blurRadius: 10,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.green.shade200,
                                            Colors.green.shade300,
                                          ],
                                        ),
                                        border: Border.all(
                                          width: size.width * 0.01,
                                          color: MyTheme.themecolor,
                                        ),
                                      ),
                                      child: ClipOval(
                                        // For circular image
                                        child: Image.file(
                                          File(selectionController
                                              .selectedPath.value),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  )
                                : PhysicalModel(
                                    color: AppColors.white,
                                    shadowColor: Colors.black,
                                    shape: BoxShape.circle, // Circular shape
                                    elevation: 5,
                                    child: Container(
                                      height: size.height * 0.13,
                                      width: size.height * 0.13,
                                      decoration: BoxDecoration(
                                        shape:
                                            BoxShape.circle, // Circular shape
                                        border: Border.all(
                                          width: size.width * 0.01,
                                          color: MyTheme.logored,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.th1wht3,
                                            spreadRadius: 0,
                                            blurRadius: 2,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: MyTheme.themecolor,
                                        size: size.width * 0.09,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   right: 0,
                        //   child: Obx(() {
                        //     if (selectionController.selectedPath.value != '') {
                        //       return GestureDetector(
                        //         onTap: handleImageSelection1,
                        //         child: Padding(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: size.width * 0.02),
                        //           child: Container(
                        //             height: size.height * 0.05,
                        //             width: size.height * 0.05,
                        //             decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               shape: BoxShape.circle,
                        //             ),
                        //             child: Center(
                        //               child: Icon(
                        //                 Icons.edit_outlined,
                        //                 color: Colors.black,
                        //                 size: size.height * 0.02,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     } else {
                        //       return Icon(
                        //         Icons.add,
                        //         color: Colors.red,
                        //       );
                        //     }
                        //   }),
                        // ),
                        Obx(() {
                          if (selectionController.selectedPath.value != '') {
                            return Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      size: size.height * 0.03,
                                      color: Colors.red,
                                    ),
                                  ),
                                  // Container(
                                  //   height: size.height * 0.05,
                                  //   width: size.height * 0.05,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     shape: BoxShape.circle,
                                  //   ),
                                  //   child: Center(
                                  //     child:
                                  //     Icon(
                                  //       Icons.check_circle,
                                  //       size: size.height * 0.03,
                                  //       color: Colors.green,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ),
                            );
                          } else {
                            return Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02),
                                    child: Container(
                                      height: size.height * 0.05,
                                      width: size.height * 0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Icon(
                                            Icons.camera_alt_rounded,
                                            size: size.height * 0.033,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
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
                    obscureText: false,
                    hintText: 'Enter username',
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
                    obscureText: false,
                    hintText: 'Enter PinCode',
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter a phone number';
                    //   } else if (value.length != 5) {
                    //     return 'Phone number must be 10 digits long';
                    //   }
                    //   return null;
                    // },
                    //suffixIcon: Icon(Icons.remove_red_eye_outlined),
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

                        ///
                        // Text(
                        //   '+91 ',
                        //   style: GoogleFonts.poppins(
                        //     fontSize: 15.0,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.black, // Added text color
                        //   ),
                        // ),
                      ],
                    ),
                    // Icon(
                    //   Icons.phone_android_outlined,
                    //   color: Colors.black,
                    // ),
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
                    obscureText: false,
                    hintText: 'Enter Your Address',
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter a phone number';
                    //   } else if (value.length != 5) {
                    //     return 'Phone number must be 10 digits long';
                    //   }
                    //   return null;
                    // },
                    //suffixIcon: Icon(Icons.remove_red_eye_outlined),
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

                        ///
                        // Text(
                        //   '+91 ',
                        //   style: GoogleFonts.poppins(
                        //     fontSize: 15.0,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.black, // Added text color
                        //   ),
                        // ),
                      ],
                    ),
                    // Icon(
                    //   Icons.phone_android_outlined,
                    //   color: Colors.black,
                    // ),
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
                    obscureText: false,
                    hintText: 'Enter Emergency Contact No.',
                    keyboardType: TextInputType.text,
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
                SizedBox(height: 20),
                HorizontalButton(
                  text: 'Update',
                  onClick: () {
                    Get.back();
                    //Get.to(Verifyotp2());
                    // Your onClick logic here
                    print('Container clicked!');
                  },
                ),
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
