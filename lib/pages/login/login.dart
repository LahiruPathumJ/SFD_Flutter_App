import 'package:flutter/material.dart';
import 'package:login/components/custom_button.dart';
import 'package:login/components/login_background.dart';
import 'package:login/pages/login/login_customer.dart';
import 'package:login/pages/welcome/welcome1.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginPageBackground(
        image1: "assets/images/welcome_img.png",
        key: null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.3),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(labelText: "Username"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: CustomButton(
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginCustomer(),
                    ),
                  );
                },
                text: 'Login',
                width: size.width * 0.4,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const WelcomePage1()),
                    ),
                  ),
                },
                child: const Text(
                  "Don't Have an Account? Sign Up",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.2791),
          ],
        ),
      ),
    );
  }
}
