import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/dialogs/filter_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/search_field.dart';

class ExpensesListPage extends StatelessWidget {
  const ExpensesListPage({super.key});

  static final List<Expenses> expenses = [
    Expenses(
      title: "Accommodation",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.person,
      trailingIconPath: AppIcons.checkOk,
    ),
    Expenses(
      title: "Travel bill",
      amount: 'Rs 6,665',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.airplane,
      trailingIconPath: AppIcons.checkOk,
    ),
    Expenses(
      title: "Accommodation",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.person,
      trailingIconPath: AppIcons.checkOk,
    ),
    Expenses(
      title: "Maintenance",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.maintenance,
      trailingIconPath: AppIcons.checkOk,
    ),
  ];

  static final List<Expenses> draftExpenses = [
    Expenses(
      title: "Accommodation",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.person,
      trailingIconPath: AppIcons.checkWait,
    ),
    Expenses(
      title: "Travel bill",
      amount: 'Rs 6,665',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.airplane,
      trailingIconPath: AppIcons.checkWait,
    ),
    Expenses(
      title: "Accommodation",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.person,
      trailingIconPath: AppIcons.checkWait,
    ),
    Expenses(
      title: "Maintenance",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.maintenance,
      trailingIconPath: AppIcons.checkWait,
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
                text: 'Mapped',
              ),
              Tab(
                text: 'Draft',
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
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const FilterDialog(),
                    );
                  },
                  child: SvgPicture.asset(AppIcons.sort))
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.separated(
                  itemCount: expenses.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ExpensesCard(
                    expenses: expenses[index],
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ExpenseDialog(),
                      );
                    },
                  ),
                ),
                ListView.separated(
                  itemCount: draftExpenses.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ExpensesCard(
                    expenses: draftExpenses[index],
                    onTap: null,
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
