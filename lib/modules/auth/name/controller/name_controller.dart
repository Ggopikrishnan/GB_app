import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameController extends GetxController {

  final nameController = TextEditingController();
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void saveName() async {

    if (nameController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your name");
      return;
    }

    isLoading.value = true;

    final uid = _auth.currentUser!.uid;

    await _firestore.collection("users").doc(uid).set({
      "uid": uid,
      "name": nameController.text.trim(),
      "phone": _auth.currentUser!.phoneNumber,
      "createdAt": FieldValue.serverTimestamp(),
    });

    isLoading.value = false;

    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}