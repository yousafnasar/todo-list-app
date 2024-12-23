import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_management/repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Controllers for user input
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user logic
  void registerUser() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await AuthenticationRepository.instance.registerUserWithEmailAndPassword(
        email,
        password,
      );

      // Save user data in Firestore
      final user = AuthenticationRepository.instance.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'fullName': fullName,
          'email': email,
        });

        Get.snackbar(
          "Success",
          "Account created successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed('/dashboard'); // Navigate to the dashboard
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void loginUser() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password)
        .then((user) {
      Get.offAllNamed('/dashboard'); // Navigate to the dashboard
    }).catchError((e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}
