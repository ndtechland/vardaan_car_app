import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';
import '../theme_color/theme_color.dart';
import '../utils/account_model.dart';
import 'onboerding_page_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Print screen size for debugging
    print('Screen Width: $screenWidth');
    print('Screen Height: $screenHeight');

    return Scaffold(
      backgroundColor: MyTheme.t1Iconcolor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;
              final imageWidth =
                  isPortrait ? screenWidth * 0.24 : screenWidth * 0.15;
              final imageHeight =
                  isPortrait ? screenHeight * 0.11 : screenHeight * 0.25;
              final imageWidth2 =
                  isPortrait ? screenWidth * 0.24 : screenWidth * 0.4;
              final imageHeight2 =
                  isPortrait ? screenHeight * 0.23 : screenHeight * 0.01;
              final textsize = isPortrait ? screenHeight * 0.55 : screenHeight;

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Image.asset(
                  //   'assets/images/ludobackblack.png', // Your background image asset
                  //   fit: BoxFit.cover,
                  // ),
                  ///

                  GetBuilder<SplashScreenControllers>(
                    init: SplashScreenControllers(),
                    builder: (controller) {
                      if (controller.animation.status ==
                          AnimationStatus.completed) {
                        // Start the timer
                        Timer(Duration(seconds: 2), () async {
                          try {
                            final accountData =
                                await accountService.getAccountData;
                            print("AccountData: $accountData");

                            if (accountData != null) {
                              //await _getprofileepersonal.profileemployeeApi();
                              //await _homedashboardController.dashboarddApi();
                              //_homedashboardController.update();
                              ///
                            } else {
                              //await _profileController.profileApi();
                              ///
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        //HomePage()
                                        OnboardingPage()),
                              );
                            }
                          } catch (error) {
                            print('Error in SplashScreen: $error');
                            // Handle error accordingly
                          }
                        });
                      }

                      ///
                      return Center(
                        child: AnimatedBuilder(
                          animation: controller.animation,
                          builder: (context, child) {
                            return Transform.scale(
                              //scaleX: 2,
                              //scaleY: 2,
                              scale: controller.animation.value * 3.6,
                              child: Container(
                                width: imageWidth * 0.9999,
                                height: imageHeight * 0.9999,
                                decoration: BoxDecoration(
                                  ///color: MyTheme.ambapptextfield2,
                                  //shape: BoxShape.circle,
                                  // border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/splashlogo2.png",
                                      //"assets/images/vardaancab_logo.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
