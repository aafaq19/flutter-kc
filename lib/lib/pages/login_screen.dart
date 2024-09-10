import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';
import 'package:kubra_collection_app/lib/constants/sizes.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/home_page.dart';
import 'package:kubra_collection_app/lib/pages/signup_controller.dart';
import 'package:kubra_collection_app/lib/pages/forget_password_mail.dart';
import 'package:kubra_collection_app/lib/pages/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());
    String email = controller.email.text;
    String password = controller.password.text;
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image(
                image: const AssetImage(tOnBoardingImage4),
                height: size.height * 0.2,
              ),
              const Text(
                tlogintitle,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                tloginsubtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelText: tEmail,
                          hintText: tEmail,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold), // Add this line
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          labelText: tPassword,
                          hintText: tPassword,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        obscureText: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Forgetpasswormailscreen(),
                              ),
                            );
                          },
                          child: const Text(
                            tForgot,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                });
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
                                tLogin.toUpperCase(),
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
                const SizedBox(height: 10),
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
                      backgroundColor: const Color.fromARGB(235, 255, 255, 255),
                      padding:
                          const EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Signupscreen()),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: '$tdonthaveaccount   ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: tSignup,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    ));
  }

  void showModelButtonsheet(
      {required BuildContext context,
      required Container Function(dynamic context) builder,
      required RoundedRectangleBorder shape}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return builder(context);
      },
    );
  }
}

class Forgetpasswordbtnwidget extends StatelessWidget {
  const Forgetpasswordbtnwidget(
      {super.key,
      required this.btnIcon,
      required this.title,
      required this.subtitle,
      required this.ontap});

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color.fromARGB(235, 149, 186, 192),
          ),
          child: Row(
            children: [
              Icon(btnIcon, size: 60.0),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
