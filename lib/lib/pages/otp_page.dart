import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';
import 'package:kubra_collection_app/lib/constants/sizes.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/otp_verified_page.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Image(
              image: AssetImage(tOnBoardingImage8),
              height: 140,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            otpverify,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            totpmessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          OtpTextField(
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            onSubmit: (code) {
              if (kDebugMode) {
                print("OTP is => $code");
              }
            },
          ),
          const SizedBox(
            height: 35.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: '$didntrecieve   ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: resend,
                            style: TextStyle(
                              color: Color.fromRGBO(67, 123, 131, 0.922),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Otpverified(key: UniqueKey()),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: const Color.fromARGB(255, 5, 5, 5),
                    backgroundColor: const Color.fromRGBO(67, 123, 131, 0.922),
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                  child: Text(
                    tverify.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18.0, // Increased font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
