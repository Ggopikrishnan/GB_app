import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/otp_controller.dart';
import '../widgets/otp_text_field.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

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

              const SizedBox(height: 60),
              Icon(
                Icons.mail_outline,
                size: 80,
                color: AppColors.gold,
              ),

              const SizedBox(height: 30),
              const Text(
                "Enter your OTP",
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
              OtpTextField(
                controller: controller.otpController,
              ),

              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the 6 digit OTP you received in your phone",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ),

              const SizedBox(height: 50),
              Obx(() => Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: controller.isChecked.value,
                          activeColor: AppColors.white,
                          checkColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          side: const BorderSide(
                            color: AppColors.white,
                            width: 1.5,
                          ),
                          onChanged: controller.toggleCheckbox,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "I certify that I am 18 years years old",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )),

              Obx(() => SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.submitOtp,
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : const Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                               color: AppColors.white,
                              ),
                            ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}