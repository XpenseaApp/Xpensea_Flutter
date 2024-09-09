import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/search_field.dart';
import 'package:xpensea/src/data/repos/globals.dart' as globals;

class ReportPage extends ConsumerWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Reports> approvedReports =
        ref.watch(reportListProvider(globals.token, 'approved')).value ?? [];
    final List<Reports> rejectedReports =
        ref.watch(reportListProvider(globals.token, 'rejected')).value ?? [];

    final List<Reports> pendingReports =
        ref.watch(reportListProvider(globals.token, 'pending')).value ?? [];

    final List<Reports> reimbursedReports =
        ref.watch(reportListProvider(globals.token, 'reimbursed')).value ?? [];

    final List<Reports> draftReports =
        ref.watch(reportListProvider(globals.token, 'drafted')).value ?? [];

    final List<Reports> draft = [
      ...draftReports,
    ];
    final List<Reports> history = [
      ...pendingReports,
      ...approvedReports,
      ...rejectedReports,
      ...reimbursedReports,
    ];

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
                  key: const PageStorageKey('drafts'),
                  itemCount: draft.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ReportCard(
                    report: draft[index],
                  ),
                ),
                ListView.separated(
                  key: const PageStorageKey('history'),
                  itemCount: history.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ReportCard(
                    report: history[index],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
