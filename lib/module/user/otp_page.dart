import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/otp_controller.dart';
import '../../theme_color/theme_color.dart';
import '../../utils/constant_text.dart';

class OtpPage extends StatelessWidget {
  final OtpController controller = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
        elevation: 0,
        backgroundColor: MyTheme.themecolor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          // This helps prevent overflow
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use min to avoid unbounded height
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: isPortrait ? screenWidth * 0.3 : screenWidth * 0.2,
                  height:
                      isPortrait ? screenHeight * 0.15 : screenHeight * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/images/vardaancab_logo.png"),
                ),
              ),
              ThreeDTitle(
                title: 'Verify OTP',
                subtitle: 'Enter the 4-digit OTP sent to your phone.',
              ),
              SizedBox(height: 20),

              Container(
                height: isPortrait ? screenHeight * 0.129 : screenHeight * 0.22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/rent44.png"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PhysicalModel(
                      color: Colors.transparent,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) {
                                return Expanded(
                                  child: _buildOtpBox(index, context),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: controller.verifyOtp,
                child: Text('Verify OTP'),
                style: ElevatedButton.styleFrom(
                  primary: MyTheme.themecolor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Obx(() => controller.isResendButtonVisible.value
                  ? TextButton(
                      onPressed: controller.resendOtp,
                      child: Text('Resend OTP'),
                      style: TextButton.styleFrom(primary: Colors.red),
                    )
                  : RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Resend OTP in ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: '${controller.countdown.value} ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.red
                                    .shade500), // Customize the color for the seconds
                          ),
                          TextSpan(
                            text: 'seconds',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )),

              SizedBox(height: 10), // Spacer between the button and the image

              Image.asset(
                "assets/images/rent88.png",
                height: isPortrait
                    ? screenHeight * 0.37
                    : screenHeight * 0.0, // Adjust for landscape
                width: screenWidth * 0.999,
                fit: BoxFit.cover,
              ),

              /// SizedBox(height: 20), // Spacer after the image
            ],
          ),
        ),
      ),
    );
  }

  // Widget for OTP input boxes
  Widget _buildOtpBox(int index, BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: screenHeight * 0.1,
        child: TextFormField(
          controller: controller.otpControllers[index],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            counterText: '', // Hides the maxLength suggestion
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: MyTheme.themecolor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: MyTheme.themecolor, width: 2.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: MyTheme.themecolor),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            if (value.isNotEmpty && index < 3) {
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
            }
            _collectOtp();
          },
        ),
      ),
    );
  }

  void _collectOtp() {
    controller.otp.value =
        controller.otpControllers.map((controller) => controller.text).join();
  }
}
