import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gb_app/app/constants/app_colors.dart';
import '../controller/onboarding_controller.dart';
import 'dot_indicator.dart';

class OnboardingPage extends GetView<OnboardingController> {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final imageHeight = height * 0.73;
    final containerHeight = height * 0.45;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Positioned(
            top: imageHeight - 130,
            left: 0,
            right: 0,
            height: containerHeight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.3, 1.0],
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                    Color(0xFF0F1118),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => DotIndicator(
                      currentIndex: controller.currentPage.value,
                      total: controller.pages.length,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: controller.nextPage,
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 18,
                           color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
