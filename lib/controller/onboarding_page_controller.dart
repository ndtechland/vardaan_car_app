import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

import '../models/onbosrding_modell.dart';
import '../module/login_page.dart';
//import 'package:ps_welness/modules_view/sign_in/sigin_screen.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  // forwardAction() {
  //   if (isLastPage) {
  //     //pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  //     Get.to(() => LoginPage());
  //     //LoginPage();
  //     //go to home page
  //   } else
  //     pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  // }

  forwardAct() {
    if (isLastPage)
      Get.to(() => LoginPage());
    //LoginPage());
    else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        "assets/images/Animation1728303160789.json",
        'Get Cabs Online',
        'We deliver high quality, affordable online cabs services in all over india.'),
    OnboardingInfo(
        "assets/images/Animation1728301900339.json",
        //'lib/assets/image/92309-online-doctor.zip',
        'Consult to expert ',
        'Find the right cabs from our list of experienced driver.'),
    OnboardingInfo(
        "assets/images/Animation1728305920713.json",
        // 'lib/assets/image/83028-ambulance.zip',
        'Quick Availability',
        'Taxi Availability in 30 minutes.'),
  ];
}
