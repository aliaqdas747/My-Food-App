import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/screens/home/homeScreen.dart';
import 'package:myfood/utils/Constants/AppColors.dart';

class SignUpController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // SignUp Method
  void SignUp(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all details",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.textColor,
      );
    } else {
      try {
        // Creating a new account
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Optionally, save the user's name to Firestore or Realtime Database
        // await saveUserData(userCredential.user!.uid, name);

        Get.snackbar(
          "Success",
          "User is created",
          snackPosition: SnackPosition.BOTTOM,
        );

        // Navigate to the home screen after successful signup
        Get.offAll(() => const Homescreen()); // Or LoginScreen()
      } on FirebaseAuthException catch (e) {
        String errorMessage = getErrorMessage(e.code);
        Get.snackbar(
          "Registration Failed",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryColor,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          "Registration Failed",
          "An unknown error occurred. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryColor,
          colorText: Colors.white,
        );
      }
    }
  }
  // Error Message Handling
  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "This email is already in use. Try logging in.";
      case 'invalid-email':
        return "Invalid email format.";
      case 'weak-password':
        return "Password should be at least 6 characters.";
      default:
        return "An unknown error occurred. Please try again.";
    }
  }
}