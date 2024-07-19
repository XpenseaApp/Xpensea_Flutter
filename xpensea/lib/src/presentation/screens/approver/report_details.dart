import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

import 'package:xpensea/src/presentation/components/appbar/appbar_backbutton.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

final expenseProvider = Provider<List<Expenses>>((ref) {
  return [
    Expenses(
      id: '1',
      title: "Accommodation",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.person,
      trailingIconPath: AppIcons.checkOk,
      status: 'mapped',
    ),
    Expenses(
      id: '2',
      title: "Travel bill",
      amount: 'Rs 6,665',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.airplane,
      trailingIconPath: AppIcons.checkOk,
      status: 'mapped',
    ),
    Expenses(
      id: '3',
      title: "Accommodation",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.person,
      trailingIconPath: AppIcons.checkOk,
      status: 'mapped',
    ),
    Expenses(
      id: '4',
      title: "Maintenance",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.maintenance,
      trailingIconPath: AppIcons.checkOk,
      status: 'mapped',
    ),
  ];
});

Reports report = Reports(
  title: 'Onam purchases',
  amount: 'Rs 1401',
  expenses: 'Expenses: 1',
  date: 'Nov 19 2023',
  leadingIconPath: AppIcons.expense,
  status: 'Approved',
  statusColor: Color.fromARGB(255, 227, 245, 235),
  statusTextColor: Colors.green,
);

class ExpenseReportScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CommonAppBarWback(index: 2),
                    const SizedBox(height: 16),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppPalette.kLSelectedColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Reimbursed',
                                    style: AppTextStyle.kMediumBodyM,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '   Reimburse Amount : Rs 2000',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppPalette.kLSelectedColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Details',
                                    style: AppTextStyle.kMediumBodyM,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16, bottom: 8),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(report.leadingIconPath),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            report.title,
                                            style: AppTextStyle.kMediumBodyM,
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                report.amount,
                                                style:
                                                    AppTextStyle.kLargeBodySB,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                report.expenses,
                                                style: AppTextStyle.kSmallBodyR,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (report.status != null)
                                      Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        decoration: BoxDecoration(
                                            color: report.statusColor ??
                                                Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Center(
                                            child: Text(
                                          report.status!,
                                          style:
                                              AppTextStyle.kSmallBodyR.copyWith(
                                            color: report.statusTextColor ??
                                                Colors.black,
                                          ),
                                        )),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        report.date,
                                        style: AppTextStyle.kSmallTitleR
                                            .copyWith(color: AppPalette.kGray3),
                                      ),
                                    ),
                                    Text(
                                      'View More',
                                      style: AppTextStyle.kSmallBodySB.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 4),
                                    SvgPicture.asset(AppIcons.arrowForward),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppPalette.kLSelectedColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Expenses',
                        style: AppTextStyle.kMediumBodyM,
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      ExpensesCard(
                        expenses: expenses[index],
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const ExpenseDialog(),
                          );
                        },
                      ),
                      const Divider(),
                    ],
                  ),
                  childCount: expenses.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppPalette.kLSelectedColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Description',
                            style: AppTextStyle.kMediumBodyM,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: AppTextStyle.kSmallBodyR,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppPalette.kLSelectedColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Comment by Approver',
                            style: AppTextStyle.kMediumBodyM,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: AppTextStyle.kSmallBodyR,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppPalette.kLSelectedColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Comment by Finance team',
                            style: AppTextStyle.kMediumBodyM,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: AppTextStyle.kSmallBodyR,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(
//     ProviderScope(
//       child: MaterialApp(
//         home: ExpenseReportScreen(),
//       ),
//     ),
//   );
// }
