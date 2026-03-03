import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {

  late PageController pageController;

  var currentPage = 0.obs;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/splash1.jpg",
      "title": "Play Smart.\nWin Real Money.",
      "subtitle":
          "Pick your favorite game, enter the contest, and place your bet with confidence. Simple, fast, and secure.",
    },
    {
      "image": "assets/images/splash1.jpg",
      "title": "Play Smart.\nWin Real Money.",
      "subtitle":
          "Pick your favorite game, enter the contest, and place your bet with confidence. Simple, fast, and secure.",
    },
    {
      "image": "assets/images/splash2.jpg",
      "title": "Play Smart.\nWin Real Money.",
      "subtitle":
          "Pick your favorite game, enter the contest, and place your bet with confidence. Simple, fast, and secure.",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed('/login'); 
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}