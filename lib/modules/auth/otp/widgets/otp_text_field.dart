import 'package:flutter/material.dart';
import '../../../../app/constants/app_colors.dart';

class OtpTextField extends StatelessWidget {

  final TextEditingController controller;

  const OtpTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      clipBehavior: Clip.none,
      children: [

        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 6,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            counterText: "",
            hintText: "Enter Your OTP",
            hintStyle: const TextStyle(
              color: AppColors.white,
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
          left: 16,
          top: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            color: AppColors.tbackground,
            child: const Text(
              "Enter Your OTP",
              style: TextStyle(
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