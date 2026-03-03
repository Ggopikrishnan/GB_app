import 'package:flutter/material.dart';
import 'package:gb_app/modules/auth/name/widgets/primary_button.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              Icon(Icons.verified, size: 200, color: AppColors.gold),

              const SizedBox(height: 50),

              const Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "You have successfully completed the\nonboarding",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.white),
              ),

              const SizedBox(height: 45),

              PrimaryButton(title: "Continue", onTap: controller.continueApp),
            ],
          ),
        ),
      ),
    );
  }
}
