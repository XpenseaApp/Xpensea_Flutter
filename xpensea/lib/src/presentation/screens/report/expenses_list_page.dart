import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/dialogs/filter_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/search_field.dart';
import 'package:xpensea/src/data/repos/globals.dart' as globals;

class ExpensesListPage extends StatelessWidget {
  const ExpensesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final List<Expenses> expenses = ref.watch(expensesProvider) ?? [];
        final List<Expenses> draftExpenses =
            ref.watch(expenseListProvider(globals.token, 'draft')).value ?? [];
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
                    text: 'Draft',
                  ),
                  Tab(
                    text: 'Mapped',
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
                      itemCount: draftExpenses.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ExpensesCard(
                        expenses: draftExpenses[index],
                        onTap: null,
                        onSelect: () {
                          Expenses expense = draftExpenses[index];
                          expense.trailingIconPath = AppIcons.checkOk;
                          ref
                              .read(expensesProvider.notifier)
                              .addExpense(expense);
                        },
                      ),
                    ),
                    ListView.separated(
                      itemCount: expenses.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ExpensesCard(
                        expenses: expenses[index],
                        onSelect: () {
                          Expenses expense = expenses[index];
                          expense.trailingIconPath = AppIcons.checkWait;
                          ref
                              .read(expensesProvider.notifier)
                              .removeExpense(expense);
                        },
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ExpenseDialog(
                              id: expenses.elementAtOrNull(index)!.id!,
                            ),
                          );
                        },
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

class ExpensesNotifier extends StateNotifier<List<Expenses>> {
  ExpensesNotifier() : super([]);

  void addExpense(Expenses expense) {
    if (!state.contains(expense)) {
      state = [...state, expense];
    }
  }

  void removeExpense(Expenses expense) {
    state = state.where((e) => e != expense).toList();
  }

  void removeAllExpense() {
    state = [];
  }
}

final expensesProvider =
    StateNotifierProvider<ExpensesNotifier, List<Expenses>>((ref) {
  return ExpensesNotifier();
});
