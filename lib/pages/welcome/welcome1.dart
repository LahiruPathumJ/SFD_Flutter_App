import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login/components/custom_button.dart';
import 'package:login/components/welcome_background.dart';
import 'package:login/components/constants.dart';
import 'package:login/components/responsive.dart';
import 'package:login/pages/welcome/welcome2.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: WelcomePageBackground(
        child: SizedBox(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Text(
                    "Secure Food Delivery",
                    style: GoogleFonts.raleway(
                      color: kTextColor,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding * 2,
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/welcome_img.png',
                      width: getScreenPropotionHeight(365, size),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let's order with SFD",
                      style: GoogleFonts.raleway(
                        color: kTextColor,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "The best place to order your food safely.",
                      style: GoogleFonts.playball(
                        color: kPrimaryColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  CustomButton(
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage2(),
                        ),
                      );
                    },
                    text: 'Get Started',
                    width: size.width * 0.5,
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
