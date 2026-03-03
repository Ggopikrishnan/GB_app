import 'package:flutter/material.dart';
import 'package:gb_app/app/constants/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        total,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          height: 6,
          width: currentIndex == index ? 27 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.white
                : AppColors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}