import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';
import 'package:kubra_collection_app/lib/constants/sizes.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/login_screen.dart';
import 'package:kubra_collection_app/lib/pages/signup_controller.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});
  static final formKey =
      GlobalKey<FormState>(); // Ensure this key is used with Form

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(tOnBoardingImage4),
                  height: size.height * 0.2,
                ),
                const Text(
                  tsignuptitle,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  tsignupsubtitle,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.fullname,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_2_rounded),
                            labelText: tfullname,
                            hintText: tfullname,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.call),
                            labelText: tnumber,
                            hintText: tnumber,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            labelText: tEmail,
                            hintText: tEmail,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_rounded),
                            labelText: tPassword,
                            hintText: tPassword,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    String email = controller.email.text.trim();
                                    String password =
                                        controller.password.text.trim();
                                    if (email.isEmpty || !email.contains('@')) {
                                      Get.snackbar("Validation Error",
                                          "Invalid email format",
                                          snackPosition: SnackPosition.BOTTOM);
                                      return;
                                    }
                                    if (password.length < 6) {
                                      Get.snackbar("Validation Error",
                                          "Password too weak",
                                          snackPosition: SnackPosition.BOTTOM);
                                      return;
                                    }
                                    controller.registerUser(email, password);
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 254, 254),
                                  backgroundColor:
                                      const Color.fromARGB(235, 8, 8, 8),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: tButtonHeight),
                                ),
                                child: Text(
                                  tSignup.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  const Text('OR',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: const Image(
                        image: AssetImage(tOnBoardingImageG),
                        width: 20.0,
                      ),
                      onPressed: () {},
                      label: const Text(
                        tsigngoogle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor:
                            const Color.fromARGB(235, 255, 255, 255),
                        padding:
                            const EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                    ),
                  ),
                ]),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: '$talreadyhaveaccount   ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: tLogin,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
