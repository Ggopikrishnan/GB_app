import 'package:flutter/material.dart';
import '../../../../app/constants/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        const CircleAvatar(
          backgroundColor: AppColors.gold,
          child: Icon(Icons.person, color: Colors.black),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome",
                style: TextStyle(color: AppColors.grey)),
            Text("User-Name",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text("₹200",
              style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }
}