import 'package:flutter/material.dart';
import 'package:gb_app/modules/auth/login/widgets/custom_text_field.dart';
import 'package:gb_app/modules/auth/name/widgets/primary_button.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/name_controller.dart';

class NameView extends GetView<NameController> {
  const NameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 60),

              Icon(Icons.badge_outlined,
                  size: 80, color: AppColors.gold),

              const SizedBox(height: 30),

              const Text(
                "You're all set to Play!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Lorem Ipsum has been the industry's\nstandard dummy text ever since the 1500s",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 40),

              CustomTextField1(
                controller: controller.nameController,
                label: "Enter Your Name",
                hint: "",
              ),

              const SizedBox(height: 30),

              Obx(() => PrimaryButton(
                    title: "Save Name",
                    isLoading: controller.isLoading.value,
                    onTap: controller.saveName,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}