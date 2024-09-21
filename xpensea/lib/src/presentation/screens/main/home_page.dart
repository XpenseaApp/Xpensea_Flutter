import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/event.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/cards/activity_card.dart';
import 'package:xpensea/src/presentation/components/cards/event_card.dart';
import 'package:xpensea/src/presentation/components/cards/menu_card.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/routes/routes.dart';
import 'package:xpensea/src/data/repos/globals.dart' as globals;

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
      MenuItems("Upload Bill", AppIcons.scanDoc, () {
        navigateTo(context, AppRoutes.captureBill);
      }),
      MenuItems("Pay Bill", AppIcons.uploadDoc, () {
        navigateTo(context, AppRoutes.captureBill);
      }),
    ];

    return Consumer(
      builder: (context, ref, child) {
        final List<Reports> draftReports =
            ref.watch(reportListProvider(globals.token, 'drafted')).value ?? [];

        final List<Reports> draft = [
          ...draftReports,
        ];

        final List<Event> progressEvents =
            ref.watch(eventListProvider(token, 'progress')).value ?? [];
        // print(progressEvents.first.toJson().toString());
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Ensure we don't wrap if there are 3 or fewer items
                  bool shouldWrap = menuCards.length > 3;

                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      menuCards.length,
                      (index) => SizedBox(
                        width: shouldWrap
                            ? (constraints.maxWidth / 2) -
                                16 // Wrap and set width for 2 items per row
                            : (constraints.maxWidth / menuCards.length) -
                                16, // Fit all in one line
                        child: MenuCard(
                          text: menuCards[index].text,
                          iconPath: menuCards[index].iconPath,
                          onTap: menuCards[index].onTap,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: progressEvents.isNotEmpty
                  ? Row(
                      children: List.generate(progressEvents.length, (index) {
                        return SizedBox(
                          width: progressEvents.length <= 1
                              ? MediaQuery.of(context).size.width * 0.925
                              : MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: EventCard(
                              id: progressEvents[index].id!,
                              Name: progressEvents[index].eventName,
                              startDate: DateTime.parse(
                                progressEvents[index]
                                    .startDate
                                    .replaceAll(' ', '-'),
                              ),
                              endDate: DateTime.parse(
                                progressEvents[index]
                                    .endDate
                                    .replaceAll(' ', '-'),
                              ),
                              endtime: progressEvents[index].endTime,
                              type: progressEvents[index].type ?? 'User',
                            ),
                          ),
                        );
                      }),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Recent Activities',
              style:
                  AppTextStyle.kMediumBodyM.copyWith(color: AppPalette.kGray3),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.separated(
                key: const PageStorageKey('drafts'),
                itemCount: draft.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ReportCard(
                  report: draft[index],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
