import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: expenses.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ExpensesCard(
              expenses: expenses[index],
            ),
          ),
        )
      ],
    );
  }
}
