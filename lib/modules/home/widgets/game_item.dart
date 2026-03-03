import 'package:flutter/material.dart';
import '../../../../app/constants/app_colors.dart';

class GameItemCard extends StatelessWidget {
  final String image;
  final String title;

  const GameItemCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 84,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.gold,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 6),

        /// Game Title
        Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}