import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/screens/approver/approval_details.dart';
import 'package:xpensea/src/presentation/screens/home/upi_payment.dart';
import 'package:xpensea/src/presentation/screens/profile/change_mpin.dart';
import 'package:xpensea/src/presentation/screens/profile/policy.dart';
import 'package:xpensea/src/presentation/screens/profile/wallet.dart';
import 'package:xpensea/src/presentation/screens/report/report_details.dart';
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
  static const String reportDetails = "/ReportDetails";
  static const String approvalDetails = "/ApprovalDetails";
  static const String changeMpin = "/changeMpin";
  static const String policy = "/policy";
  static const String wallet = "/wallet";
  static const String debug = "/debug";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      otp: (context) => const OtpPage(),
      mainpage: (context) => const MainScreen(),
      createEvent: (context) => const CreateEvent(),
      createReport: (context) => const CreateReport(),
      captureBill: (context) => const CaptureBillPage(),
      reportDetails: (context) => const ReportDetail(id: ''),
      approvalDetails: (context) => const ApprovalDetails(id: ''),
      changeMpin: (context) => ChangeMPINPage(),
      policy: (context) => const PolicyPage(),
      wallet: (context) => const WalletPage(),
      debug: (context) => const SplashScreen(),
    };
  }
}
