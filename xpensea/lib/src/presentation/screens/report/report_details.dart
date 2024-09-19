import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';

import 'package:xpensea/src/presentation/components/appbar/appbar_backbutton.dart';
import 'package:xpensea/src/presentation/components/buttons/outline_button.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/report/expenses_list_page.dart';

class ReportDetail extends StatelessWidget {
  final String id;

  const ReportDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final id = arguments != null ? arguments['id'] : this.id;

    return Consumer(
      builder: (context, ref, child) {
        List<Expenses> expenses = [];
        final report = ref.watch(getReportProvider(id, null, token)).value;
        final expensesNotifier = ref.watch(expensesProvider);

        if (report != null && report.isNotEmpty) {
          log('Report: $report');
          final List<dynamic> expenseList = report['expenses'] ?? [];
          expenses = expenseList.map((e) => Expenses.fromJson(e)).toList();

          // Combine expenses from report and provider if drafted
          if (report['status'] == 'drafted') {
            final notifierExpenses = expensesNotifier;
            final combinedExpenses = [...expenses, ...notifierExpenses];
            expenses =
                combinedExpenses.toSet().toList(); // Remove duplicates if any
          }

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              const CommonAppBarWback(
                                  index: 0, heading: 'Report'),
                              const SizedBox(height: 16),
                              const SizedBox(height: 10),
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppPalette.kLSelectedColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Details',
                                              style: AppTextStyle.kMediumBodyM,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 16, bottom: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.airplane),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      report['title'] ??
                                                          'No Title',
                                                      style: AppTextStyle
                                                          .kMediumBodyM,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          report['totalAmount']
                                                                  ?.toString() ??
                                                              '0',
                                                          style: AppTextStyle
                                                              .kLargeBodySB,
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        Text(
                                                          'Expenses: ${report['expenseCount'] ?? 0}',
                                                          style: AppTextStyle
                                                              .kSmallBodyR,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (report['status'] != null)
                                                Container(
                                                  width: 100,
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      report['status'] ??
                                                          'Unknown',
                                                      style: AppTextStyle
                                                          .kSmallBodyR
                                                          .copyWith(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          const SizedBox(height: 32),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  report['date'] ?? 'No Date',
                                                  style: AppTextStyle
                                                      .kSmallTitleR
                                                      .copyWith(
                                                    color: AppPalette.kGray3,
                                                  ),
                                                ),
                                              ),
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
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
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
                                      builder: (context) => ExpenseDialog(
                                          id: expenses
                                              .elementAtOrNull(index)!
                                              .id!),
                                    );
                                  },
                                ),
                                const Divider(),
                              ],
                            ),
                            childCount: expenses.length,
                          ),
                        ),
                        if (expenses.isEmpty)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'No expenses found.',
                                style: AppTextStyle.kSmallBodyR.copyWith(
                                  color: AppPalette.kGray3,
                                ),
                              ),
                            ),
                          ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              report['status'] != 'drafted'
                                  ? SizedBox.shrink()
                                  : SolidButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          enableDrag: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1,
                                              child: Material(
                                                // Adding Material here to provide the needed Material structure
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          height: 4,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child:
                                                              ExpensesListPage(
                                                            isDraft: true,
                                                            id: id,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Add Expense'),
                              const SizedBox(height: 20),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppPalette.kLSelectedColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Description',
                                      style: AppTextStyle.kMediumBodyM,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Lorem ipsum dolor sit amet, cona qui officia deserunt mollit anim id est laborum.',
                                style: AppTextStyle.kSmallBodyR,
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppPalette.kLSelectedColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Comment by Approver',
                                      style: AppTextStyle.kMediumBodyM,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Lorem ipsum dolor sit amet, consecteroident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                style: AppTextStyle.kSmallBodyR,
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppPalette.kLSelectedColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Comment by Finance team',
                                      style: AppTextStyle.kMediumBodyM,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Lorem ipsum dolor sit amet, consecteroident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                style: AppTextStyle.kSmallBodyR,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  report['status'] == 'drafted'
                      ? Column(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: CustomOutLineButton(
                                        text: 'Save Draft',
                                        onPressed: () async {
                                          final response = await UpdateReport(
                                              id!,
                                              expenses
                                                  .map((e) => e.id)
                                                  .whereType<String>()
                                                  .toList(),
                                              token,
                                              'drafted',
                                              context);
                                          log('Response: $response');
                                          ref.invalidate(getReportProvider);
                                          ref.watch(expensesProvider).clear();
                                        }),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: SolidButton(
                                      text: 'Submit',
                                      onPressed: () async {
                                        final response = await UpdateReport(
                                            id!,
                                            expenses
                                                .map((e) => e.id)
                                                .whereType<String>()
                                                .toList(),
                                            token,
                                            'pending',
                                            context);
                                        log('Response: $response');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
