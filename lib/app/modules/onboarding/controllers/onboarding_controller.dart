import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  RxInt currentPage = 0.obs;
  RxList<String> imagePaths = [
    'assets/icons/onboarding1.svg',
    'assets/icons/onboarding2.svg',
    'assets/icons/onboarding3.svg',
  ].obs;


  final PageController pageController = PageController();

  // Function to change the page
  void nextPage() {
    currentPage = RxInt((currentPage.value + 1) % imagePaths.length);
    pageController.animateToPage(
      currentPage.value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Automatic page change with a timer
    Timer.periodic(Duration(seconds: 3), (timer) {
      nextPage();
    });
  }
}
