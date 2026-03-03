import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final mobileController = TextEditingController();
  var isChecked = false.obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  void register() async {

    if (mobileController.text.isEmpty) {
      Get.snackbar("Error", "Please enter mobile number");
      return;
    }

    if (!isChecked.value) {
      Get.snackbar("Error", "Please confirm age verification");
      return;
    }

    isLoading.value = true;

    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${mobileController.text.trim()}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Error", e.message ?? "OTP Failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.offAllNamed('/otp', arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }
}