import 'package:flutter/material.dart';

class AppTextStyle {
  static const String kUnnaFamily = "Unna";
  static const String kInterFamily = "Inter";

  static const kDisplayTitleR = TextStyle(
    fontFamily: kUnnaFamily,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 44,
  );

  static const kDisplayTitleM = TextStyle(
    fontFamily: kUnnaFamily,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 28,
  );

  static const kSmallTitleR = TextStyle(
    fontFamily: kInterFamily,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 14,
  );
}
