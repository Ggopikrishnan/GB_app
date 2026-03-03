import 'package:flutter/material.dart';
import 'package:gb_app/modules/home/widgets/bottom_nav_widget.dart';
import 'package:gb_app/modules/home/widgets/section_title.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controllers/cricket_controller.dart';

class CricketView extends GetView<CricketController> {
  const CricketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: const BottomNavWidget(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/splash.png", width: 50),
                  SizedBox(width: 50),
                   Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/leading icon.png",
                width: 18, 
                height: 18,
                fit: BoxFit.contain,
                color: Colors.white, 
              ),
              SizedBox(width: 6),
              Text(
                "₹200",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6),
              Image.asset(
                "assets/images/trailing icon.png",
                width: 18, 
                height: 18,
                fit: BoxFit.contain,
                color: Colors.white, 
              ),
            ],
          ),
        ),
                ],
              ),
            ),

            const Divider(color: Colors.white12),

            const SizedBox(height: 15),
            Center(child: SectionTitle(title: "Cricket")),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/cri.png",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
