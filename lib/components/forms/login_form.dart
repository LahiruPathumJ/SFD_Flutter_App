import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/components/constants.dart';
import 'package:login/components/fields/input_field.dart';
import 'package:login/components/fields/password_field.dart';
import 'package:login/components/submit_button.dart';
import 'package:login/pages/welcome/welcome2.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController contact = TextEditingController();
  TextEditingController orderid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            width: widget.size.width,
            height: widget.defaultLoginSize,
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
                  filter:
                      FilteringTextInputFormatter.allow(RegExp(r"[A-Za-z0-9]")),
                  keyboardtype: TextInputType.name,
                  maxlen: 10,
                  namecontroller: orderid,
                ),
                const SizedBox(height: 10),
                SubmitButton(
                  width: widget.size.width * 0.8,
                  title: "CUSTOMER LOGIN",
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage2(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
