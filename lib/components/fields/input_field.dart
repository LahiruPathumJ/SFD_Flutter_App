import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/components/constants.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.maxlen,
    required this.filter,
    required this.keyboardtype,
    required this.namecontroller,
  }) : super(key: key);

  final int maxlen;
  final String hint;
  final IconData icon;
  final TextInputType keyboardtype;
  final FilteringTextInputFormatter filter;
  final TextEditingController namecontroller;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hideCloseButton = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withAlpha(50),
      ),
      child: TextField(
        onChanged: (text) {
          setState(() {
            hideCloseButton = widget.namecontroller.text == "" ? true : false;
          });
        },
        cursorColor: kPrimaryColor,
        keyboardType: widget.keyboardtype,
        inputFormatters: <TextInputFormatter>[widget.filter],
        maxLength: widget.maxlen,
        controller: widget.namecontroller,
        decoration: InputDecoration(
            icon: Icon(widget.icon, color: kPrimaryColor),
            counterText: "",
            suffixIcon: hideCloseButton
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        hideCloseButton = !hideCloseButton;
                        widget.namecontroller.text = "";
                      });
                    }),
            hintText: widget.hint,
            border: InputBorder.none),
      ),
    );
  }
}
