import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/search_field.dart';
import 'package:xpensea/src/data/repos/globals.dart' as globals;

class ApproverPage extends StatelessWidget {
  const ApproverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final List<Reports> approved =
            ref.watch(approversListProvider(globals.token, 'approved')).value ??
                [];
        final List<Reports> rejected =
            ref.watch(approversListProvider(globals.token, 'rejected')).value ??
                [];
        final List<Reports> pending =
            ref.watch(approversListProvider(globals.token, 'pending')).value ??
                [];

        final List<Reports> all =
            [approved, rejected, pending].expand((x) => x).toList();

        return DefaultTabController(
          length: 4, // Updated from 2 to 4
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
                    text: 'All',
                  ),
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Approved',
                  ),
                  Tab(
                    text: 'Rejected',
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
                      itemCount: all.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ReportCard(
                        report: all[index],
                        isReport: false,
                      ),
                    ),
                    ListView.separated(
                      itemCount: pending.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ReportCard(
                        report: pending[index],
                        isReport: false,
                      ),
                    ),
                    ListView.separated(
                      itemCount: approved.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ReportCard(
                        report: approved[index],
                        isReport: false,
                      ),
                    ),
                    ListView.separated(
                      itemCount: rejected.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ReportCard(
                        report: rejected[index],
                        isReport: false,
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
