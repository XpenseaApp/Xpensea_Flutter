import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/search_field.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  static final List<Reports> draftReports = [
    Reports(
      title: 'Onam purchases',
      amount: 'Rs 1,401',
      expenses: '3 expenses',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.docFilled,
    ),
    Reports(
      title: 'Maintains',
      amount: 'Rs 601',
      expenses: '25 expenses',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.docFilled,
    ),
    Reports(
      title: 'Shop purchases',
      amount: 'Rs 2,601',
      expenses: '68 expenses',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.docFilled,
    ),
    Reports(
      title: 'Staff Expenses',
      amount: 'Rs 5,401',
      expenses: '03 expenses',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.docFilled,
    ),
  ];
  static final List<Reports> history = [
    Reports(
      title: 'Onam purchases',
      amount: 'Rs 1,401',
      expenses: '3 expenses',
      date: 'Nov 19 2023',
      status: 'Reimbursed',
      leadingIconPath: AppIcons.docFilled,
      statusColor: AppPalette.iconBg,
      statusTextColor: AppPalette.kPrimaryColor,
    ),
    Reports(
      title: 'Maintains',
      amount: 'Rs 601',
      expenses: '25 expenses',
      date: 'Nov 19 2023',
      status: 'Approved',
      leadingIconPath: AppIcons.eventFilled,
      statusColor: AppPalette.kLGreen,
      statusTextColor: AppPalette.kLGreen.withOpacity(1),
    ),
    Reports(
      title: 'Shop purchases',
      amount: 'Rs 2,601',
      expenses: '68 expenses',
      date: 'Nov 19 2023',
      status: 'Rejected',
      leadingIconPath: AppIcons.docFilled,
      statusColor: AppPalette.kLOrange,
      statusTextColor: AppPalette.kLOrange.withOpacity(1),
    ),
    Reports(
      title: 'Staff Expenses',
      amount: 'Rs 5,401',
      expenses: '03 expenses',
      date: 'Nov 19 2023',
      status: 'Submitted',
      leadingIconPath: AppIcons.eventFilled,
      statusColor: AppPalette.kLPeach,
      statusTextColor: AppPalette.kLDarkOrange,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicatorColor: AppPalette.kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: AppTextStyle.kSmallBodySB.copyWith(fontSize: 14),
            tabs: const [
              Tab(
                text: 'Drafts',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(child: CustomSearchField()),
              const SizedBox(
                width: 28,
              ),
              SvgPicture.asset(AppIcons.sort)
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.separated(
                  itemCount: draftReports.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ReportCard(
                    report: draftReports[index],
                  ),
                ),
                ListView.separated(
                  itemCount: history.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ReportCard(
                    report: history[index],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
