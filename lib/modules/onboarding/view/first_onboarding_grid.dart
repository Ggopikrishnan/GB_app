import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gb_app/app/constants/app_colors.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/dot_indicator.dart';

class FirstOnboardingGrid extends StatefulWidget {
  final String title;
  final String subtitle;

  const FirstOnboardingGrid({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<FirstOnboardingGrid> createState() => _FirstOnboardingGridState();
}

class _FirstOnboardingGridState extends State<FirstOnboardingGrid> {

  late ScrollController row1Controller;
  late ScrollController row2Controller;
  late ScrollController row3Controller;

  final List<String> images = [
    "assets/images/i1.jpg",
    "assets/images/i2.jpg",
    "assets/images/i3.jpg",
    "assets/images/i4.jpg",
    "assets/images/i5.jpg",
    "assets/images/i6.jpg",
    "assets/images/i7.jpg",
    "assets/images/i8.jpg",
    "assets/images/i9.jpg",
  ];

  @override
  void initState() {
    super.initState();

    row1Controller = ScrollController();
    row2Controller = ScrollController();
    row3Controller = ScrollController();

    autoScroll(row1Controller, false);
    autoScroll(row2Controller, true);
    autoScroll(row3Controller, false);
  }

  void autoScroll(ScrollController controller, bool reverse) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final maxScroll = controller.position.maxScrollExtent;

      controller.animateTo(
        reverse ? 0 : maxScroll,
        duration: const Duration(seconds: 20),
        curve: Curves.linear,
      ).then((_) {
        controller.jumpTo(reverse ? maxScroll : 0);
        autoScroll(controller, reverse);
      });
    });
  }

  @override
  void dispose() {
    row1Controller.dispose();
    row2Controller.dispose();
    row3Controller.dispose();
    super.dispose();
  }

  Widget buildRow(List<String> rowImages, ScrollController controller) {
    return SizedBox(
      height: 140,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            ...rowImages,
            ...rowImages, // duplicate for smooth loop
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  e,
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final controller = Get.find<OnboardingController>();

    return Stack(
      children: [

        /// 🔥 IMAGE GRID AREA
        SizedBox(
          height: height * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildRow(images.sublist(0, 3), row1Controller),
              buildRow(images.sublist(3, 6), row2Controller),
              buildRow(images.sublist(6, 9), row3Controller),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: height * 0.45,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.black87,
                  Color(0xFF0F1118),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),

              Obx(() => DotIndicator(
                    currentIndex: controller.currentPage.value,
                    total: controller.pages.length,
                  )),

              const SizedBox(height: 25),

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
            ],
          ),
        ),
      ],
    );
  }
}