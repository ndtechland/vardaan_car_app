import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../controller/driver_controller/change_password_driver_controller.dart';
import '../../theme_color/theme_color.dart';
import '../../utils/constant_text.dart';

class ChangePasswordDriver extends StatelessWidget {
  final TextEditingController oldpassword = TextEditingController();
  final TextEditingController newpassword = TextEditingController();

  final ChangePasswordDriverController _changepassdriverController =
      Get.put(ChangePasswordDriverController());

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: myAppBar(
        backgroundColor: MyTheme.drivericon,
        title: 'Change Password',
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
      body: Obx(
        () => _changepassdriverController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _changepassdriverController.changepassworddriverFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SafeArea(
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      bool isPortrait = orientation == Orientation.portrait;
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                // Background Image
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Icon(Icons.arrow_back_ios),
                                //     Center(
                                //       child: Container(
                                //         width: screenWidth * 0.3,
                                //         height: isPortrait
                                //             ? screenHeight * 0.2
                                //             : screenHeight * 0.3, // Adjust for landscape
                                //         decoration: BoxDecoration(
                                //           color: Colors.white,
                                //           shape: BoxShape.circle,
                                //         ),
                                //         child: Image.asset(
                                //             "assets/images/vardaancab_logo.png"),
                                //       ),
                                //     ),
                                //     Container(),
                                //   ],
                                // ),
                                // Login Form
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.05,
                                  ), // Responsive padding
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      // 3D Title and Subtitle
                                      ThreeDTitle(
                                        title: 'Change Password?',
                                        subtitle: '',
                                      ),
                                      SizedBox(
                                          height:
                                              0), // Space between title and input
                                      // Phone Number Input
                                      Container(
                                        height: isPortrait
                                            ? screenHeight * 0.37
                                            : screenHeight *
                                                0.57, // Adjust for landscape
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/rent44.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: PhysicalModel(
                                              color: Colors.transparent,
                                              shadowColor: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              elevation: 4,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          controller:
                                                              _changepassdriverController
                                                                  .passwordController1,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter your Old password';
                                                            }
                                                            return null;
                                                          },
                                                          //focusNode: _userFocusNode, // Assign FocusNode

                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Old Password',
                                                            labelStyle:
                                                                TextStyle(
                                                              color: MyTheme
                                                                  .themecolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  width: 2),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 1),
                                                            ),
                                                            prefixIcon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      12.0),
                                                              child: Icon(
                                                                Icons.password,
                                                                color: MyTheme
                                                                    .ThemeColors,
                                                              ),
                                                            ),
                                                            hintText:
                                                                'Enter Old Password',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade500),
                                                            contentPadding:
                                                                EdgeInsets.symmetric(
                                                                    vertical:
                                                                        15.0,
                                                                    horizontal:
                                                                        10.0),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          // maxLength: 8,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          cursorColor:
                                                              Colors.blueAccent,
                                                        ),
                                                        Spacer(),
                                                        TextFormField(
                                                          controller:
                                                              _changepassdriverController
                                                                  .passwordController2,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter your password';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'New Password',
                                                            labelStyle:
                                                                TextStyle(
                                                              color: MyTheme
                                                                  .themecolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  width: 2),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 1),
                                                            ),
                                                            prefixIcon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      12.0),
                                                              child: Icon(
                                                                Icons.password,
                                                                color: MyTheme
                                                                    .ThemeColors,
                                                              ),
                                                            ),
                                                            hintText:
                                                                'Enter New Password',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade500),
                                                            contentPadding:
                                                                EdgeInsets.symmetric(
                                                                    vertical:
                                                                        15.0,
                                                                    horizontal:
                                                                        10.0),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          // maxLength: 8,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          cursorColor:
                                                              Colors.blueAccent,
                                                        ),
                                                        Spacer(),
                                                        TextFormField(
                                                          controller:
                                                              _changepassdriverController
                                                                  .passwordController3,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Re enter your password';
                                                            }
                                                            if (value !=
                                                                _changepassdriverController
                                                                    .passwordController2
                                                                    .text) {
                                                              return 'Passwords do not match';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Confirm New Password',
                                                            labelStyle:
                                                                TextStyle(
                                                              color: MyTheme
                                                                  .themecolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  width: 2),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 1),
                                                            ),
                                                            prefixIcon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      12.0),
                                                              child: Icon(
                                                                Icons.password,
                                                                color: MyTheme
                                                                    .ThemeColors,
                                                              ),
                                                            ),
                                                            hintText:
                                                                'Enter New Password',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade500),
                                                            contentPadding:
                                                                EdgeInsets.symmetric(
                                                                    vertical:
                                                                        15.0,
                                                                    horizontal:
                                                                        10.0),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          // maxLength: 8,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          cursorColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      // Login Button
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_changepassdriverController
                                                  .changepassworddriverFormKey
                                                  .currentState
                                                  ?.validate() ??
                                              false) {
                                            _changepassdriverController
                                                .checkPasswordchange(context);
                                          }
                                          ;
                                          // Validate phone number
                                          if (newpassword.text.length > 4) {
                                            // Navigate to OTP Page
                                            ///Get.to(() => HomePageDriver());
                                          } else {
                                            Get.snackbar('Error',
                                                'Password minimum 4 character');
                                          }
                                        },
                                        child: Text('UPDATE'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MyTheme.drivericon,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                      //SizedBox(height: 10), // Space after the button
                                    ],
                                  ),
                                ),
                                Spacer(), // Pushes the bottom image down
                                Image.asset(
                                  "assets/images/rent55.png",
                                  height: isPortrait
                                      ? screenHeight * 0.42
                                      : screenHeight *
                                          0.39, // Adjust for landscape
                                  width: screenWidth,
                                  fit: BoxFit.cover,
                                ),
                                // SizedBox(
                                //   height: screenHeight * 0.0,
                                // ),
                                Spacer(),
                                // Pushes the bottom image down
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
