import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/components/constants.dart';
import 'package:login/components/fields/input_field.dart';
import 'package:login/components/submit_button.dart';
import 'package:login/pages/welcome/welcome2.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: widget.size.width,
              height: widget.defaultLoginSize,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // SvgPicture.asset('assets/images/login.svg'),
                  const SizedBox(height: 10),
                  InputField(
                    hint: "Name",
                    namecontroller: name,
                    icon: Icons.person,
                    filter:
                        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z ]")),
                    keyboardtype: TextInputType.text,
                    maxlen: 20,
                  ),
                  InputField(
                    hint: "Contact Number",
                    icon: Icons.phone,
                    namecontroller: contact,
                    filter: FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                    keyboardtype: TextInputType.number,
                    maxlen: 10,
                  ),
                  InputField(
                    hint: "Email",
                    icon: Icons.email,
                    namecontroller: email,
                    filter: FilteringTextInputFormatter.allow(
                        RegExp(r"[A-Za-z0-9]|@|\.")),
                    keyboardtype: TextInputType.emailAddress,
                    maxlen: 50,
                  ),
                  InputField(
                    hint: "Address",
                    maxlen: 50,
                    namecontroller: address,
                    filter: FilteringTextInputFormatter.allow(
                        RegExp(r"[A-Za-z0-9]|/|,| |\.")),
                    keyboardtype: TextInputType.streetAddress,
                    icon: Icons.location_on,
                  ),
                  const SizedBox(height: 25),
                  SubmitButton(
                    width: widget.size.width * 0.8,
                    title: "SIGN UP",
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage2(),
                        ),
                      );
                      // clear();
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

  // void clear() {
  //   RegisterForm.name.text = "";
  //   RegisterForm.contact.text = "";
  //   RegisterForm.email.text = "";
  //   RegisterForm.address.text = "";
  // }
}
