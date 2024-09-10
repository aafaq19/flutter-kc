import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:kubra_collection_app/lib/constants/colors.dart';
import 'package:kubra_collection_app/lib/constants/image_strings.dart';
import 'package:kubra_collection_app/lib/constants/text_strings.dart';
import 'package:kubra_collection_app/lib/pages/otp_mobile_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          liquidController: controller,
          onPageChangeCallback: onPageChangeCallback,
          pages: [
            Container(
              color: tOnBoardingPage1Color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 40.0), // Set the desired padding here
                    child: SizedBox(
                      height: 390,
                      width: 430,
                      child: Image(image: AssetImage(tOnBoardingImage1)),
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          tOnBoardingTitle1,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 2,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 165.0),
                        child: Text(
                          tOnBoardingSubTitle1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 65, 64, 64),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      tOnBoardingCounter1,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: tOnBoardingPage2Color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 40.0), // Set the desired padding here
                    child: SizedBox(
                      height: 390,
                      width: 430,
                      child: Image(image: AssetImage(tOnBoardingImage3)),
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          tOnBoardingTitle2,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 165.0),
                        child: Text(
                          tOnBoardingSubTitle2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 65, 64, 64),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      tOnBoardingCounter2,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: tOnBoardingPage3Color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 40.0), // Set the desired padding here
                    child: SizedBox(
                      height: 390,
                      width: 430,
                      child: Image(image: AssetImage(tOnBoardingImage2)),
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          tOnBoardingTitle3,
                          style: TextStyle(
                            fontSize: 24.3,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 165.0),
                        child: Text(
                          tOnBoardingSubTitle3,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 65, 64, 64),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      tOnBoardingCounter3,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
            ),
          ],
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
        ),
        Positioned(
          bottom: 60.0,
          child: OutlinedButton(
            onPressed: () {
              int nextPage = controller.currentPage + 1;
              controller.animateToPage(page: nextPage);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.black26),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  color: tDarkColor, shape: BoxShape.circle),
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: TextButton(
            onPressed: () {
              // Use Navigator to navigate to another page
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Otpmobile(),
                  transitionDuration: const Duration(milliseconds: 650),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: AnimatedSmoothIndicator(
            count: 3,
            activeIndex: controller.currentPage,
            effect: const WormEffect(
              activeDotColor: Color(0xff272727),
              dotHeight: 5.0,
            ),
          ),
        )
      ],
    ));
  }

  onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
