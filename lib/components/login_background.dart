import 'package:flutter/material.dart';

class LoginPageBackground extends StatelessWidget {
  final Widget child;
  final String image1;
  const LoginPageBackground({
    Key? key,
    required this.child,
    required this.image1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/top1.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
                width: size.width,
              )),
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/top2.png",
                width: size.width,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
              )),
          Positioned.fill(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/bottom1.png",
                width: size.width,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bottom2.png",
              width: size.width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Positioned(
            bottom: 35,
            left: 20,
            child: Image.asset(
              image1,
              width: size.width * 0.3,
            ),
          ),
          child
        ],
      ),
    );
  }
}
