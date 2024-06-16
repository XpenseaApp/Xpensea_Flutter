import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/screens/main_screen.dart';
import 'package:xpensea/src/presentation/screens/otp_page.dart';

class AppRoutes {
  static const String splash = "/";
  static const String otp = "/otp";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const MainScreen(),
      otp: (context) => const OtpPage()
    };
  }
}
