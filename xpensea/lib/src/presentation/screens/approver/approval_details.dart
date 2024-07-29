import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';

import 'package:xpensea/src/presentation/components/appbar/appbar_backbutton.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class ApprovalDetails extends StatelessWidget {
  final String id;

  ApprovalDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final id = arguments != null ? arguments['id'] : this.id;

    return Consumer(
      builder: (context, ref, child) {
        List<Expenses> expenses = [];
        final report = ref.watch(getApprovalProvider(id, token)).value;

        if (report != null && report.isNotEmpty) {
          log('Report: $report');
          final List<dynamic> expenseList = report['expenses'] ?? [];
          expenses = expenseList.map((e) => Expenses.fromJson(e)).toList();
          log(expenses.first.id.toString());

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          CommonAppBarWback(index: 2),
                          const SizedBox(height: 16),
                          // Container(
                          //   child: Column(
                          //     children: [
                          //       SizedBox(
                          //         height: 40,
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             color: AppPalette.kLSelectedColor,
                          //             borderRadius: BorderRadius.circular(4),
                          //           ),
                          //           child: Align(
                          //             alignment: Alignment.centerLeft,
                          //             child: Padding(
                          //               padding:
                          //                   const EdgeInsets.only(left: 8.0),
                          //               child: Text(
                          //                 'Reimbursed',
                          //                 style: AppTextStyle.kMediumBodyM,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       Container(
                          //         alignment: Alignment.centerLeft,
                          //         child: Text(
                          //           '   Reimburse Amount : Rs 2000',
                          //           style: TextStyle(color: Colors.green),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Details',
                                          style: AppTextStyle.kMediumBodyM,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 16, bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(AppIcons
                                              .airplane), // Replace with a relevant icon
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  report['title'] ?? 'No Title',
                                                  style:
                                                      AppTextStyle.kMediumBodyM,
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
                                                    const SizedBox(width: 8),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                  child: Text(
                                                report['status'] ?? 'Unknown',
                                                style: AppTextStyle.kSmallBodyR
                                                    .copyWith(
                                                  color: Colors.black,
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
                                              report['date'] ?? 'No Date',
                                              style: AppTextStyle.kSmallTitleR
                                                  .copyWith(
                                                      color: AppPalette.kGray3),
                                            ),
                                          ),
                                          Text(
                                            'View More',
                                            style: AppTextStyle.kSmallBodySB
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          const SizedBox(width: 4),
                                          SvgPicture.asset(
                                              AppIcons.arrowForward),
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
                                  builder: (context) => ExpenseDialog(
                                      id: expenses.elementAtOrNull(index)!.id!),
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
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
