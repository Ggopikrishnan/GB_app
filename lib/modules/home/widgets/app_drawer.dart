import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/home_controller.dart';

class AppDrawer extends GetView<HomeController> {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: AppColors.card,
      child: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.gold,
              child: Icon(Icons.person,
                  size: 40,
                  color: Colors.black),
            ),

            const SizedBox(height: 10),

             Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  return Text(
                    controller.userName.value,
                    style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  );
                }),

            const Divider(
              color: Colors.grey,
              height: 30,
            ),

            drawerItem(Icons.home, "Home"),
            drawerItem(Icons.account_balance_wallet,
                "Wallet"),
            drawerItem(Icons.history, "Game History"),
            drawerItem(Icons.settings, "Settings"),
            drawerItem(Icons.logout, "Logout"),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.gold),
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.white),
      ),
      onTap: () {},
    );
  }
}