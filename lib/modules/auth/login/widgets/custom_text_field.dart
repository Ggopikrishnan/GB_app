import 'package:flutter/material.dart';
import 'package:gb_app/app/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          style: const TextStyle( 
            color: AppColors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
            filled: true,
            fillColor: const Color(0xFF15161E),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 22,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF5B5C7A),
                width: 1.3,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: 1.6,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            color: AppColors.tbackground,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class CustomTextField1 extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const CustomTextField1({

    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.name,
          style: const TextStyle( 
            color: AppColors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
            filled: true,
            fillColor: const Color(0xFF15161E),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 22,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF5B5C7A),
                width: 1.3,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: 1.6,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            color: AppColors.tbackground,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}