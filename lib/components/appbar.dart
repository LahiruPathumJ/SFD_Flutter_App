import 'package:flutter/material.dart';
import 'package:login/components/constants.dart';

Positioned whiteBackground(Size size) {
  return Positioned(
    child: Container(
      width: size.width,
      height: 190,
      color: kBackgroundColor,
    ),
  );
}

Positioned circle1() {
  return Positioned(
    top: -50,
    left: -50,
    child: Container(
      width: 190,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: kPrimaryColor,
      ),
    ),
  );
}

Positioned circle2() {
  return Positioned(
    top: 50,
    right: -50,
    child: Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: kPrimaryColor,
      ),
    ),
  );
}

Positioned mainTitle(Size size, String title) {
  return Positioned.fill(
    top: 130,
    child: Align(
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: kPrimaryColor,
        ),
      ),
    ),
  );
}

Stack topBar(Size size, String title) {
  return Stack(
    children: [
      whiteBackground(size),
      circle2(),
      circle1(),
      mainTitle(size, title),
    ],
  );
}
