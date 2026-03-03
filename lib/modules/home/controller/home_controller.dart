import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
var isLoading = true.obs; 
  var selectedIndex = 0.obs;
  final PageController bannerController = PageController();
  var currentBanner = 0.obs;
void changeTab(int index) {
  selectedIndex.value = index;

  switch (index) {
    case 0:
      Get.toNamed('/home');
      break;
    case 1:
      Get.toNamed('/games');
      break;
    case 2:
      Get.toNamed('/rummy');
      break;
    case 3:
      Get.toNamed('/cricket');
      break;
  }
}

  final List<String> banners = [
    "assets/images/d6.png",
    "assets/images/d7.jpg",
    "assets/images/d8.png",
  ];

  final List<String> banners1 = [
    "assets/images/c1.jpg",
    "assets/images/c2.jpg",
    "assets/images/c3.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    startAutoSlide();
  }

  void fetchUserData() async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    var doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (doc.exists) {
      userName.value = doc['name'];
    }
  } catch (e) {
    print("Error fetching user: $e");
  } finally {
    isLoading.value = false;
  }
}

  void startAutoSlide() {
    Future.delayed(const Duration(seconds: 2), () {
      if (bannerController.hasClients) {
        int nextPage = currentBanner.value + 1;

        if (nextPage >= banners.length) {
          nextPage = 0;
        }

        bannerController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        currentBanner.value = nextPage;
      }

      startAutoSlide();
    });
  }

  void onBannerChanged(int index) {
    currentBanner.value = index;
  }

  @override
  void onClose() {
    bannerController.dispose();
    super.onClose();
  }

  final categories = [
    {"title": "Card", "image": "assets/images/i4.jpg"},
    {"title": "Sports", "image": "assets/images/d2.jpg"},
    {"title": "Lottery", "image": "assets/images/d3.png"},
    {"title": "Casino", "image": "assets/images/d4.jpg"},
    {"title": "Horse", "image": "assets/images/splash1.jpg"},
  ];
}
