import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
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
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ExpensePage(),
    const ReportPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle:
              AppTextStyle.kSmallBodyR.copyWith(color: AppPalette.kGray4),
          selectedLabelStyle: AppTextStyle.kSmallBodyR.copyWith(
              color: AppPalette.kPrimaryColor, fontWeight: FontWeight.w500),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.home),
              activeIcon: SvgPicture.asset(AppIcons.homeFilled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.expense),
              activeIcon: SvgPicture.asset(AppIcons.expenseFilled),
              label: 'Expense',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.report),
              activeIcon: SvgPicture.asset(AppIcons.reportFilled),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profile),
              activeIcon: SvgPicture.asset(AppIcons.profileFilled),
              label: 'Profile',
            ),
          ]),
    );
  }
}
