import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/cards/activity_card.dart';
import 'package:xpensea/src/presentation/components/cards/menu_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class MenuItems {
  final String text;
  final String iconPath;

  MenuItems(this.text, this.iconPath);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<MenuItems> _menuCards = [
    MenuItems("Create Events", AppIcons.event),
    MenuItems("Capture Bill", AppIcons.scanDoc),
    MenuItems("Upload Bill", AppIcons.event),
  ];

  static final List<Activity> activities = [
    Activity(
      title: 'Onam purchases',
      amount: 'Rs 1,401',
      expenses: '3 expenses',
      date: 'Nov 19 2023',
      status: 'Reimbursed',
      statusColor: AppPalette.kLGreen,
    ),
    Activity(
      title: 'Maintains',
      amount: 'Rs 601',
      expenses: '25 expenses',
      date: 'Nov 19 2023',
      status: 'Approved',
      statusColor: AppPalette.kLGreen,
    ),
    Activity(
      title: 'Shop purchases',
      amount: 'Rs 2,601',
      expenses: '68 expenses',
      date: 'Nov 19 2023',
      status: 'Rejected',
      statusColor: AppPalette.kLOrange,
    ),
  ];
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
        onPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppIcons.starFilled),
                  SvgPicture.asset(AppIcons.notificationBell),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Hi, lets manage expenses',
                style: AppTextStyle.kDisplayTitleM,
              ),
              const SizedBox(
                height: 28,
              ),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 8,
                  children: List.generate(
                    _menuCards.length,
                    (index) => MenuCard(
                      text: _menuCards[index].text,
                      iconPath: _menuCards[index].iconPath,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (context, index) => ActivityCard(
                    activity: activities[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
