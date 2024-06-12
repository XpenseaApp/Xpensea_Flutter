import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/screens/home_page.dart';
import 'package:xpensea/src/presentation/screens/main_screen.dart';
import 'package:xpensea/src/presentation/screens/otp_page.dart';
import 'package:xpensea/src/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String otp = "/otp";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      otp: (context) => const OtpPage()
    };
  }
}
