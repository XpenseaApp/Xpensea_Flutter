import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/filter_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/search_field.dart';
import 'package:xpensea/src/data/repos/globals.dart' as globals;

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final List<Expenses> mappedExpenses =
            ref.watch(expenseListProvider(globals.token, 'mapped')).value ?? [];

        final List<Expenses> approvedExpenses =
            ref.watch(expenseListProvider(globals.token, 'approved')).value ??
                [];

        final List<Expenses> expenses =
            [mappedExpenses, approvedExpenses].expand((x) => x).toList();

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
                        onTap: () {},
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
      },
    );
  }
}
