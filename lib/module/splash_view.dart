import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenControllers controller = Get.put(SplashScreenControllers());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashScreenControllers>(
          builder: (controller) {
            return AnimatedBuilder(
              animation: controller.animation,
              builder: (context, child) {
                // Using the animation value to scale the logo
                return Transform.scale(
                  scale: controller?.animation.value,
                  child: SizedBox(
                    width: screenWidth * 0.54,
                    height: screenHeight * 0.54,
                    child: Image.asset("assets/images/splashlogo2.png"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
