import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vardaancar/module/driver/home_page_driver.dart';
import 'package:vardaancar/module/user/home_page.dart';

import '../module/onboerding_page_screen.dart';
import 'driver_controller/profile_controller_driver.dart';
import 'employee_controllers/employee_get_profile_controller.dart';

class SplashScreenControllers extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  ProfileController _driverprofileController = Get.put(ProfileController());
  EmployeeGetProfileController _employeegetprofile =
      Get.put(EmployeeGetProfileController());

  @override
  void onInit() {
    animationInitialization();
    super.onInit();
  }

  void animationInitialization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() {
      update(); // Update UI as the animation progresses
    });
    animationController.forward();

    // Wait for the animation to finish before triggering auto-login
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _autoLogin();
      }
    });
  }

  Future<void> _autoLogin() async {
    // Simulate loading time (you can remove this later)
    await Future.delayed(Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();

    // Fetch user data from SharedPreferences
    final String? role = prefs.getString('role');
    final int? userId = prefs.getInt('userId');

    // Print the fetched userId and role for debugging purposes
    print("User ID: $userId");
    print("Role: $role");

    // If the user is logged in and role exists, navigate accordingly
    if (role != null && userId != null) {
      if (role.toLowerCase() == 'driver') {
        await _driverprofileController.driverprofileApi();
        await Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(builder: (context) => HomePageDriver()),
        );
      } else if (role.toLowerCase() == 'employee') {
        await _employeegetprofile.employeeprofileApi();
        await Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(builder: (context) => OnboardingPage()),
        );
      }
    } else {
      // If no saved data or role, navigate to onboarding page
      Navigator.pushReplacement(
        Get.context!,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
      );
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
