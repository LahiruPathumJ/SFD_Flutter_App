import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login/components/custom_button.dart';
import 'package:login/components/welcome_background.dart';
import 'package:login/components/constants.dart';
import 'package:login/components/responsive.dart';
import 'package:login/pages/login/login_customer.dart';
import 'package:login/pages/login/login_rider.dart';

class WelcomePage1 extends StatefulWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  bool startState = true;
  @override
  void initState() {
    super.initState();
    startState = true;
  }

  void toggle() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        startState = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: WelcomePageBackground(
        child: SizedBox(
          child: SingleChildScrollView(
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
                        startState ? "Let's order with SFD" : "Let's get in...",
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
                        startState
                            ? "The best place to order your food"
                            : "Stay with Secure Food Delivery",
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
                    startState
                        ? CustomButton(
                            tap: () {
                              setState(() {
                                startState = false;
                                toggle();
                              });
                            },
                            text: 'Get Started',
                            width: size.width * 0.5,
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  tap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginCustomer(),
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
                                        builder: (context) =>
                                            const LoginRider(),
                                      ),
                                    );
                                  },
                                  text: 'Rider',
                                  width: size.width * 0.5,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: size.height * 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
