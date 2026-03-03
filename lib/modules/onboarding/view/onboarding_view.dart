import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/onboarding_widget.dart';
import 'first_onboarding_grid.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.pages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final page = controller.pages[index];

              if (index == 0) {
                return FirstOnboardingGrid(
                  title: page['title']!,
                  subtitle: page['subtitle']!,
                );
              }

              return OnboardingPage(
                image: page['image']!,
                title: page['title']!,
                subtitle: page['subtitle']!,
              );
            },
          ),
        ],
      ),
    );
  }
}
