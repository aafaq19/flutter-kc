import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kubra_collection_app/lib/constants/sizes.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/password_updated.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';

class Newscreen extends StatelessWidget {
  const Newscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Center(
              child: Image(
                image: AssetImage(tOnBoardingImage6),
                height: 200,
                width: 200,
              ),
            ),
            const Text(
              crendential,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              identity,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Form(
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    labelText: newpassword,
                    hintText: newpassword,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    labelText: confirmpassword,
                    hintText: confirmpassword,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Verified(key: UniqueKey())));
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: Color.fromARGB(255, 12, 12, 12),
                      backgroundColor: const Color.fromARGB(235, 67, 123, 131),
                      padding:
                          const EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
                    child: Text(update.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
