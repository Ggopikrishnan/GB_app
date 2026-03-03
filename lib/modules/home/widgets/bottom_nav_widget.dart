import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/home_controller.dart';

class BottomNavWidget extends GetView<HomeController> {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColors.card,
        type: BottomNavigationBarType.fixed, 
        elevation: 0,

        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.white,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),

        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeTab,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: "Games",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Leaderboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}