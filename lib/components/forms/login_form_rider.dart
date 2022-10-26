import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:login/components/constants.dart';
import 'package:login/components/fields/input_field.dart';
import 'package:login/components/fields/password_field.dart';
import 'package:login/components/submit_button.dart';
import 'package:login/pages/welcome/welcome2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFormRider extends StatefulWidget {
  const LoginFormRider({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<LoginFormRider> createState() => _LoginFormRiderState();
}

class _LoginFormRiderState extends State<LoginFormRider> {
  final GlobalKey<FormState> formKeyLoginRider = GlobalKey<FormState>();

  static TextEditingController contact = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<http.Response> postData(String mobno, String password) async {
    String token;
    SharedPreferences riderToken = await SharedPreferences.getInstance();
    riderToken.setString("mobnoRider", contact.text);
    Map<String, String> data = {"mobno": mobno, "password": password};
    final body = jsonEncode(data);
    final response = await http.post(
      Uri.parse("https://35.171.26.170/api/auth/rider"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      token = response.body;
      setState(() {
        riderToken.setString("riderToken", token);
      });
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SizedBox(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: Form(
              key: formKeyLoginRider,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // SvgPicture.asset('assets/images/register.svg'),
                  Image.asset(
                    'assets/images/login_customer.jpg',
                    width: widget.size.width * 0.3,
                  ),
                  const SizedBox(height: 40),
                  InputField(
                    maxlen: 10,
                    icon: Icons.phone,
                    hint: "Contact Number",
                    namecontroller: contact,
                    keyboardtype: TextInputType.number,
                    filter: FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                  ),
                  PasswordField(
                    hint: "Password",
                    filter: FilteringTextInputFormatter.allow(
                        RegExp(r"[A-Za-z0-9]")),
                    keyboardtype: TextInputType.name,
                    maxlen: 10,
                    namecontroller: password,
                  ),
                  const SizedBox(height: 10),
                  SubmitButton(
                    width: widget.size.width * 0.8,
                    title: "RIDER LOGIN",
                    tap: () async {
                      if (formKeyLoginRider.currentState!.validate()) {
                        formKeyLoginRider.currentState!.save();
                        // final http.Response response =
                        // await postData(contact.text, password.text);
                        // if (response.statusCode == 200) {}

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage2(),
                          ),
                        );
                      }
                    },
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
