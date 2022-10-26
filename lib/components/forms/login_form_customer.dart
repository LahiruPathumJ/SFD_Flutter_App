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

class LoginFormCustomer extends StatefulWidget {
  const LoginFormCustomer({
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
  State<LoginFormCustomer> createState() => _LoginFormCustomerState();
}

class _LoginFormCustomerState extends State<LoginFormCustomer> {
  final GlobalKey<FormState> formKeyLoginCustomer = GlobalKey<FormState>();

  static TextEditingController contact = TextEditingController();
  TextEditingController orderid = TextEditingController();

  Future<http.Response> postData(String mobno, String orderid) async {
    String token;
    SharedPreferences userToken = await SharedPreferences.getInstance();
    userToken.setString("mobno", contact.text);

    Map<String, String> data = {"mobno": mobno, "orderid": orderid};
    final body = jsonEncode(data);
    final response = await http.post(
      Uri.parse("https://35.171.26.170/api/auth/customer"),
      headers: {"Content-Type": "application/json", "connection": "keep-alive"},
      body: body,
    );
    if (response.statusCode == 200) {
      token = response.body;
      setState(() {
        userToken.setString("userToken", token);
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
              key: formKeyLoginCustomer,
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
                    hint: "Order ID",
                    filter: FilteringTextInputFormatter.allow(
                        RegExp(r"[A-Za-z0-9]")),
                    keyboardtype: TextInputType.name,
                    maxlen: 10,
                    namecontroller: orderid,
                  ),
                  const SizedBox(height: 10),
                  SubmitButton(
                    width: widget.size.width * 0.8,
                    title: "CUSTOMER LOGIN",
                    tap: () async {
                      if (formKeyLoginCustomer.currentState!.validate()) {
                        formKeyLoginCustomer.currentState!.save();
                        // final response =
                        //     await postData(contact.text, orderid.text);
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
