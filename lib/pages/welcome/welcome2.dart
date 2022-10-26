import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/components/custom_button.dart';
import 'package:login/components/welcome_background.dart';
import 'package:login/components/constants.dart';
import 'package:login/pages/login/login_customer.dart';
import 'package:login/components/responsive.dart';
import 'package:login/pages/login/login_rider.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({Key? key}) : super(key: key);

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
                  SizedBox(height: size.height * 0.025),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 1.75,
                      vertical: kDefaultPadding,
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: Image.asset(
                            'assets/images/bg1.png',
                            width: getScreenPropotionHeight(365, size),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Stay with\nSecure Food Delivery   ',
                              style: GoogleFonts.acme(
                                fontStyle: FontStyle.italic,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(184, 8, 1, 111),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let's get in...",
                      style: GoogleFonts.playball(
                        color: const Color.fromARGB(200, 1, 0, 33),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          tap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginCustomer(),
                              ),
                            );
                          },
                          text: 'Customer',
                          width: size.width * 0.5,
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 3),
                      Expanded(
                        child: CustomButton(
                          tap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginRider(),
                              ),
                            );
                          },
                          text: 'Rider',
                          width: size.width * 0.5,
                        ),
                      ),
                    ],
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
