import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';

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
  static const kLargeBodyB = TextStyle(
    fontFamily: kInterFamily,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 18,
  );

  static const kLargeBodySB = TextStyle(
    fontFamily: kInterFamily,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 18,
  );
  static const kMediumBodyM = TextStyle(
    fontFamily: kInterFamily,
    fontWeight: FontWeight.w500,
    color: AppPalette.kGray1,
    fontSize: 16,
  );
  static const kSmallBodySB = TextStyle(
    fontFamily: kInterFamily,
    fontWeight: FontWeight.w600,
    color: AppPalette.kPrimaryColor,
    fontSize: 12,
  );
  static const kSmallBodyR = TextStyle(
    fontFamily: kInterFamily,
    fontWeight: FontWeight.w400,
    color: AppPalette.kGray2,
    fontSize: 12,
  );
}
