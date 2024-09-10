import 'package:flutter/material.dart';
import 'package:kubra_collection_app/lib/constants/colors.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';
import 'package:kubra_collection_app/lib/constants/sizes.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/login_screen.dart';
import 'package:kubra_collection_app/lib/pages/signup_screen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: const AssetImage(tOnBoardingImage4), height: height * 0.4),
          const Column(
            children: [
              Text(
                tWelcomeTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 67, 123, 131),
                ),
              ),
              Text(tWelcomeSubTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: tsecondaryColor,
                    side: const BorderSide(color: tsecondaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                  child: Text(
                    tLogin.toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signupscreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(235, 67, 123, 131),
                    side: const BorderSide(color: tsecondaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                  child: Text(
                    tSignup.toUpperCase(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
