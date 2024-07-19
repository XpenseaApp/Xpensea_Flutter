import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/presentation/components/appbar/appbar.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/routes/routes.dart';
import 'package:xpensea/src/presentation/screens/main/approver_page.dart';
import 'package:xpensea/src/presentation/screens/main/expense_page.dart';
import 'package:xpensea/src/presentation/screens/main/home_page.dart';
import 'package:xpensea/src/presentation/screens/main/profile_page.dart';
import 'package:xpensea/src/presentation/screens/main/report_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<Widget> get _pages {
    List<Widget> pages = [
      const HomePage(),
      const ExpensePage(),
      const ReportPage(),
      const ProfilePage(),
    ];
    if (approver) {
      pages.insert(2, const ApproverPage());
    }
    return pages;
  }

  List<BottomNavigationBarItem> get _bottomNavItems {
    List<BottomNavigationBarItem> items = [
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
    ];
    if (approver) {
      items.insert(
          2,
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.report),
            activeIcon: SvgPicture.asset(AppIcons.reportFilled),
            label: 'Approver',
          ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.kPrimaryColor,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          switch (_currentIndex) {
            case 0:
              // Action for Home page
              break;
            case 1:
              // Action for Expense page
              break;
            case 2:
              if (approver) {
                // Action for Approver page
                break;
              }
              Navigator.pushNamed(context, AppRoutes.createReport);
              // Action for Report page
              break;
            case 3:
              if (approver) {
                Navigator.pushNamed(context, AppRoutes.createReport);
                // Action for Report page
                break;
              }
              // Action for Profile page
              break;
            case 4:
              // Action for Profile page
              break;
          }
        },
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  CommonAppBar(index: _currentIndex),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(child: _pages[_currentIndex]),
                ],
              ))),
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
          items: _bottomNavItems),
    );
  }
}
