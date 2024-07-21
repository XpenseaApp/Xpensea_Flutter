import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/cards/activity_card.dart';
import 'package:xpensea/src/presentation/components/cards/event_card.dart';
import 'package:xpensea/src/presentation/components/cards/menu_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/routes/routes.dart';

class MenuItems {
  final String text;
  final String iconPath;
  final VoidCallback? onTap;

  MenuItems(this.text, this.iconPath, this.onTap);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Activity> activities = [
    Activity(
      title: 'Onam purchases',
      amount: 'Rs 1,401',
      expenses: '3 expenses',
      date: 'Nov 19 2023',
      status: 'Reimbursed',
      statusColor: AppPalette.iconBg,
      statusTextColor: AppPalette.kPrimaryColor,
    ),
    Activity(
      title: 'Maintains',
      amount: 'Rs 601',
      expenses: '25 expenses',
      date: 'Nov 19 2023',
      status: 'Approved',
      statusColor: AppPalette.kLGreen,
      statusTextColor: AppPalette.kLGreen.withOpacity(1),
    ),
    Activity(
      title: 'Shop purchases',
      amount: 'Rs 2,601',
      expenses: '68 expenses',
      date: 'Nov 19 2023',
      status: 'Rejected',
      statusColor: AppPalette.kLOrange,
      statusTextColor: AppPalette.kLOrange.withOpacity(1),
    ),
    Activity(
      title: 'Staff Expenses',
      amount: 'Rs 5,401',
      expenses: '03 expenses',
      date: 'Nov 19 2023',
      status: 'Submitted',
      statusColor: AppPalette.kLPeach,
      statusTextColor: AppPalette.kLDarkOrange,
    ),
  ];

  void navigateTo(BuildContext context, String path) {
    Navigator.pushNamed(context, path);
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuItems> menuCards = [
      MenuItems("Create Events", AppIcons.event, () {
        navigateTo(context, AppRoutes.createEvent);
      }),
      MenuItems("Capture Bill", AppIcons.scanDoc, () {
        navigateTo(context, AppRoutes.captureBill);
      }),
      MenuItems("Upload Bill", AppIcons.uploadDoc, null),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              menuCards.length,
              (index) => MenuCard(
                text: menuCards[index].text,
                iconPath: menuCards[index].iconPath,
                onTap: menuCards[index].onTap,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const EventCard()),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const EventCard()),
          ]),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Recent Events',
          style: AppTextStyle.kMediumBodyM.copyWith(color: AppPalette.kGray3),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: activities.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ActivityCard(
              activity: activities[index],
            ),
          ),
        )
      ],
    );
  }
}
