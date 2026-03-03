import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
        color: AppColors.background,  
        ),
        child: Center(
          child: Image.asset(
            "assets/images/splash.png",
              height: MediaQuery.of(context).size.height * 0.1, 
              fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}