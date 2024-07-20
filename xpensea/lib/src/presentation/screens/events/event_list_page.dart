import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  static final List<Expenses> expenses = [
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
      id: '1',
      title: "Travel bill",
      amount: 'Rs 6,665',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.airplane,
      trailingIconPath: AppIcons.checkOk,
      status: 'mapped',
    ),
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
      id: '1',
      title: "Maintenance",
      amount: 'Rs 1,401',
      date: 'Nov 19 2023',
      leadingIconPath: AppIcons.maintenance,
      trailingIconPath: AppIcons.checkOk,
      status: 'mapped',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Onam Celebration',
            style: AppTextStyle.kItalicTitleM,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: AppTextStyle.kSmallTitleR,
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Start on :20/05/2024',
                style: AppTextStyle.kItalicSmallTitleM,
              ),
              Text(
                'End on :20/05/2024',
                style: AppTextStyle.kItalicSmallTitleM,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          Column(
            children: List<Widget>.generate(
              expenses.length,
              (index) => ExpensesCard(
                expenses: expenses[index],
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        ExpenseDialog(id: expenses.elementAtOrNull(index)!.id!),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
