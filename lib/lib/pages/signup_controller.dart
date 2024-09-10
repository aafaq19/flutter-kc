import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kubra_collection_app/lib/pages/authentication_repository.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final number = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    try {
      print("Attempting to register with email: $email and password: $password");
      await Authenticationrepository.instance.createUserwithEmailAndPassword(email, password);
      // If the function above does not throw an exception, assume success and navigate.
     // Get.offAll(() => Welcomescreen());  // Navigate to the HomeScreen
    } catch (e, stackTrace) {
  print('Error: $e');
  print('StackTrace: $stackTrace');
      // Handle error, possibly show an error message to the user
      Get.snackbar("Signup Error", "Failed to register: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
