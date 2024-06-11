import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/screens/expense_page.dart';
import 'package:xpensea/src/presentation/screens/home_page.dart';
import 'package:xpensea/src/presentation/screens/profile_page.dart';
import 'package:xpensea/src/presentation/screens/report_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ExpensePage(),
    const ReportPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
