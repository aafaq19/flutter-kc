import 'package:flutter/material.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/login_screen.dart';

class Verified extends StatelessWidget {
  const Verified({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              passwordupdated,
              style: TextStyle(
                color: Color.fromARGB(235, 12, 12, 12),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            const Center(
              child: Image(
                image: AssetImage(tOnBoardingImage5),
                height: 140,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              yourpassword,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                backgroundColor: const Color.fromARGB(235, 67, 123, 131),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 140.0), // Increased padding
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 10, 10, 10), // Text color of the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
