import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

  final otpController = TextEditingController();
  var isChecked = false.obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  @override
  void onInit() {
    verificationId = Get.arguments;
    super.onInit();
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  void submitOtp() async {

    if (otpController.text.length != 6) {
      Get.snackbar("Error", "Enter valid 6 digit OTP");
      return;
    }

    if (!isChecked.value) {
      Get.snackbar("Error", "Please confirm age verification");
      return;
    }

    isLoading.value = true;

    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      await _auth.signInWithCredential(credential);

      Get.offAllNamed('/name');
    } catch (e) {
      Get.snackbar("Error", "Invalid OTP");
    }

    isLoading.value = false;
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}