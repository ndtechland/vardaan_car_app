import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vardaancar/controller/phone_login_controller.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../theme_color/theme_color.dart';
import '../../utils/constant_text.dart';

class OtpPageEmp extends StatelessWidget {
  final PhoneLoginController _loginController = Get.put(PhoneLoginController());
  final List<TextEditingController> otpControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final String mobileNumber;

  OtpPageEmp({required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: myAppBar(
        backgroundColor: MyTheme.drivericon,
        title: 'Verify OTP',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ThreeDTitle(
                            title: 'Enter Your OTP.',
                            subtitle: '',
                          ),
                        ),
                        SizedBox(height: 0),
                        //         backgroundColor: MyTheme.themecolor,
                        Container(
                          height: isPortrait
                              ? screenHeight * 0.17
                              : screenHeight * 0.27, // Adjust for landscape
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/rent44.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                shadowColor: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(4, (index) {
                                              return SizedBox(
                                                width: 60,
                                                child: TextField(
                                                  controller:
                                                      otpControllers[index],
                                                  focusNode: focusNodes[index],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign
                                                      .center, // This will center the text inside the TextField

                                                  textInputAction:
                                                      TextInputAction.next,
                                                  maxLength: 1,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  cursorColor:
                                                      Colors.blueAccent,
                                                  cursorHeight: 18,
                                                  decoration: InputDecoration(
                                                    counterText: '',
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: '0',
                                                  ),
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty &&
                                                        index < 3) {
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              focusNodes[
                                                                  index + 1]);
                                                    } else if (value.isEmpty &&
                                                        index > 0) {
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              focusNodes[
                                                                  index - 1]);
                                                    }
                                                  },
                                                ),
                                              );
                                            }),
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

                        // Container(
                        //   height: isPortrait
                        //       ? screenHeight * 0.17
                        //       : screenHeight * 0.27,
                        //   decoration: BoxDecoration(
                        //     borderRadius:
                        //     BorderRadius.circular(10),
                        //     image: DecorationImage(
                        //       image: AssetImage(
                        //           "assets/images/rent44.png"),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment:
                        //         MainAxisAlignment.spaceBetween,
                        //     children: List.generate(4, (index) {
                        //       return SizedBox(
                        //         width: 60,
                        //         child: TextField(
                        //           controller: otpControllers[index],
                        //           focusNode: focusNodes[index],
                        //           keyboardType: TextInputType.number,
                        //           textAlign: TextAlign
                        //               .center, // This will center the text inside the TextField
                        //
                        //           textInputAction: TextInputAction.next,
                        //           maxLength: 1,
                        //           style: TextStyle(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //           cursorColor: Colors.blueAccent,
                        //           cursorHeight: 18,
                        //           decoration: InputDecoration(
                        //             counterText: '',
                        //             border: OutlineInputBorder(),
                        //             hintText: '0',
                        //           ),
                        //           onChanged: (value) {
                        //             if (value.isNotEmpty && index < 3) {
                        //               FocusScope.of(context)
                        //                   .requestFocus(
                        //                       focusNodes[index + 1]);
                        //             } else if (value.isEmpty &&
                        //                 index > 0) {
                        //               FocusScope.of(context)
                        //                   .requestFocus(
                        //                       focusNodes[index - 1]);
                        //             }
                        //           },
                        //         ),
                        //       );
                        //     }),
                        //   ),
                        // ),

                        SizedBox(height: 20),

                        Obx(() {
                          return ElevatedButton(
                            onPressed: _loginController.isLoading.value
                                ? null
                                : () {
                                    String otp = otpControllers
                                        .map((controller) =>
                                            controller.text.trim())
                                        .join();
                                    if (otp.length == 4) {
                                      _loginController.verifyOtpEmp(
                                          mobileNumber, otp);
                                    } else {
                                      Get.snackbar('Error',
                                          'Please enter the complete OTP');
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.drivericon,
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 29),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            child: _loginController.isLoading.value
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    "Verify",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          );
                        }),

                        Spacer(), // Pushes the bottom image down
                        Image.asset(
                          "assets/images/rent55.png",
                          height: isPortrait
                              ? screenHeight * 0.42
                              : screenHeight * 0.39, // Adjust for landscape
                          width: screenWidth,
                          fit: BoxFit.cover,
                        ),
                        // SizedBox(
                        //   height: screenHeight * 0.0,
                        // ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
