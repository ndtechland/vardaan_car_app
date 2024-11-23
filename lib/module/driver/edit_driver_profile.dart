import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_buttom.dart';
import '../../contantss/textfield_constant/textfield_reuse.dart';
import '../../controller/driver_controller/profile_controller_driver.dart';
import '../../controller/driver_controller/update_profile_driver_controller.dart';
import '../../controller/driver_controller/update_profile_picture_driver.dart';
import '../../theme_color/theme_color.dart';

class EditDriverProfilePages extends StatelessWidget {
  final GlobalKey<FormState> _formconnectionKey = GlobalKey<FormState>();
  //Update_profile _update_profile = Get.put(Update_profile());

  UpdateProfileDriverController _updateProfileDriverController =
      Get.put(UpdateProfileDriverController());

  UpdateDriverProfileController _profilepictureController =
      Get.put(UpdateDriverProfileController());

  ProfileController _profileController = Get.put(ProfileController());

  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);
  void _showImageSourceSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    selectedImage.value = File(pickedFile.path);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    selectedImage.value = File(pickedFile.path);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _updateProfileDriverController.updateprofiledriverFormKey,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: myAppBar(
          backgroundColor: MyTheme.drivericon,
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

                  Obx(() {
                    return selectedImage.value != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(selectedImage.value!),
                          )
                        : CircleAvatar(
                            radius: 60,
                            child: Icon(Icons.person, size: 60),
                          );
                  }),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _showImageSourceSelector(context),
                    child: Text("Select Image"),
                  ),
                  SizedBox(height: 16),
                  Obx(() {
                    return _profilepictureController.isLoading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (selectedImage.value != null) {
                                final bytes =
                                    selectedImage.value!.readAsBytesSync();
                                final base64Image = base64Encode(bytes);

                                _profilepictureController
                                    .updateDriverProfilePic(
                                  driverImage:
                                      selectedImage.value!.path.split('/').last,
                                  driverImageBase64: base64Image,
                                  id: _profileController
                                      .getdriverprofileModel!.data!.id!
                                      .toInt(),
                                );
                              } else {
                                Get.snackbar(
                                    "Error", "Please select an image first.");
                              }
                            },
                            child: Text("Update Profile Picture"),
                          );
                  }),
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
                      controller:
                          _updateProfileDriverController.drivernameController,
                      textColor: MyTheme.themecolor,
                      fieldColor: MyTheme.dvrskyblue6,
                      hintText: 'Enter username',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      prefixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                      controller:
                          _updateProfileDriverController.emailController,
                      obscureText: false,
                      textColor: MyTheme.themecolor,
                      fieldColor: MyTheme.dvrskyblue6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      hintText: 'Enter Email',
                      keyboardType: TextInputType.text,
                      prefixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  //     child: Text(
                  //       'Phone Number',
                  //       style: GoogleFonts.poppins(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: size.width * 0.027,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.005,
                  // ),
                  // Directionality(
                  //   textDirection: TextDirection.ltr,
                  //   child: CustomTextField(
                  //     obscureText: false,
                  //     textColor: MyTheme.themecolor,
                  //     fieldColor: MyTheme.dvrskyblue6,
                  //     hintText: 'Enter Phone',
                  //     keyboardType: TextInputType.text,
                  //     prefixIcon: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 8.0),
                  //           child: Icon(
                  //             Icons.phone_android_outlined,
                  //             color: Colors.red,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: size.height * 0.01),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  //     child: Text(
                  //       'PinCode',
                  //       style: GoogleFonts.poppins(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: size.width * 0.027,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.005,
                  // ),
                  // Directionality(
                  //   textDirection: TextDirection.ltr,
                  //   child: CustomTextField(
                  //     obscureText: false,
                  //     textColor: MyTheme.themecolor,
                  //     fieldColor: MyTheme.dvrskyblue6,
                  //     hintText: 'Enter PinCode',
                  //     keyboardType: TextInputType.text,
                  //     // validator: (value) {
                  //     //   if (value == null || value.isEmpty) {
                  //     //     return 'Please enter a phone number';
                  //     //   } else if (value.length != 5) {
                  //     //     return 'Phone number must be 10 digits long';
                  //     //   }
                  //     //   return null;
                  //     // },
                  //     //suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  //     prefixIcon: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //           child: Icon(
                  //             Icons.pin,
                  //             color: Colors.red,
                  //           ),
                  //         ),
                  //
                  //         ///
                  //         // Text(
                  //         //   '+91 ',
                  //         //   style: GoogleFonts.poppins(
                  //         //     fontSize: 15.0,
                  //         //     fontWeight: FontWeight.w500,
                  //         //     color: Colors.black, // Added text color
                  //         //   ),
                  //         // ),
                  //       ],
                  //     ),
                  //     // Icon(
                  //     //   Icons.phone_android_outlined,
                  //     //   color: Colors.black,
                  //     // ),
                  //   ),
                  // ),
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
                      controller:
                          _updateProfileDriverController.addressController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      textColor: MyTheme.themecolor,
                      fieldColor: MyTheme.dvrskyblue6,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                      controller: _updateProfileDriverController
                          .alternatephoneController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Alternate No';
                        }
                        return null;
                      },
                      textColor: MyTheme.themecolor,
                      fieldColor: MyTheme.dvrskyblue6,
                      hintText: 'Enter Emergency Contact No.',
                      keyboardType: TextInputType.text,
                      prefixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                  Obx(() {
                    return HorizontalButton(
                      text: _updateProfileDriverController.isLoading.value
                          ? 'Loading...'
                          : 'Update',
                      onClick: _updateProfileDriverController.isLoading.value
                          ? null
                          : () {
                              _updateProfileDriverController
                                  .checkUpdateProfileDriver(context);
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
      ),
    );
  }
}
