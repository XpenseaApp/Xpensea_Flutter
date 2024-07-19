import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/screens/approver/report_details.dart';
import 'package:xpensea/src/presentation/screens/expense/capture_bill.dart';
import 'package:xpensea/src/presentation/screens/events/create_event.dart';
import 'package:xpensea/src/presentation/screens/main_screen.dart';
import 'package:xpensea/src/presentation/screens/otp_page.dart';
import 'package:xpensea/src/presentation/screens/report/create_report.dart';
import 'package:xpensea/src/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String otp = "/otp";
  static const String mainpage = "/mainpage";
  static const String createReport = "/createReport";
  static const String createEvent = "/createEvent";
  static const String captureBill = "/captureBill";
  static const String debug = "/debug";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      otp: (context) => const OtpPage(),
      mainpage: (context) => const MainScreen(),
      createEvent: (context) => const CreateEvent(),
      createReport: (context) => const CreateReport(),
      captureBill: (context) => const CaptureBillPage(),
      debug: (context) => ExpenseReportScreen(),
    };
  }
}
