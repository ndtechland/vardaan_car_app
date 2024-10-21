import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme_color/theme_color.dart';
import '../utils/constant_text.dart';
import 'user/otp_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
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
                      // Background Image
                      Center(
                        child: Container(
                          width: screenWidth * 0.3,
                          height: isPortrait
                              ? screenHeight * 0.2
                              : screenHeight * 0.3, // Adjust for landscape
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:
                              Image.asset("assets/images/vardaancab_logo.png"),
                        ),
                      ),
                      // Login Form
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ), // Responsive padding
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // 3D Title and Subtitle
                            ThreeDTitle(
                              title: 'Welcome to Vardaan Car',
                              subtitle: 'Please log in to continue',
                            ),
                            SizedBox(
                                height: 10), // Space between title and input

                            // Phone Number Input
                            Container(
                              height: isPortrait
                                  ? screenHeight * 0.15
                                  : screenHeight * 0.29, // Adjust for landscape
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/rent44.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
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
                                          child: TextField(
                                            controller: phoneController,
                                            decoration: InputDecoration(
                                              labelText: 'Phone Number',
                                              labelStyle: TextStyle(
                                                color: MyTheme.themecolor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.blueAccent,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1),
                                              ),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: MyTheme.ThemeColors,
                                                ),
                                              ),
                                              hintText:
                                                  'Enter your phone number',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey.shade500),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                      horizontal: 10.0),
                                            ),
                                            keyboardType: TextInputType.phone,
                                            maxLength: 10,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            cursorColor: Colors.blueAccent,
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
                                // Validate phone number
                                if (phoneController.text.length == 10) {
                                  // Navigate to OTP Page
                                  Get.to(() => OtpPage());
                                } else {
                                  Get.snackbar('Error',
                                      'Please enter a valid phone number');
                                }
                              },
                              child: Text('Send OTP'),
                              style: ElevatedButton.styleFrom(
                                primary: MyTheme.themecolor,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
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
                            : screenHeight * 0.39, // Adjust for landscape
                        width: screenWidth,
                        fit: BoxFit.cover,
                      ),
                      // SizedBox(
                      //   height: screenHeight * 0.0,
                      // ),
                      Spacer(), // Pushes the bottom image down
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
