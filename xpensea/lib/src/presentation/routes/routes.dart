import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/screens/navigation/main_screen.dart';
import 'package:xpensea/src/presentation/screens/otp_page.dart';
import 'package:xpensea/src/presentation/screens/report/create_report.dart';

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
