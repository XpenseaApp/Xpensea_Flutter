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

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final List<Reports> history =
            ref.watch(reportListProvider(globals.token, 'rejected')).value ??
                [];
        final List<Reports> draftReports =
            ref.watch(reportListProvider(globals.token, 'pending')).value ?? [];
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
      },
    );
  }
}
