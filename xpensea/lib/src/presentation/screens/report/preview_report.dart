import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/regular_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/title_textfield.dart';

class PreviewReport extends StatelessWidget {
  const PreviewReport({super.key});

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic Details',
            style: AppTextStyle.kLargeBodyB.copyWith(
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TitleTextField(
            labelText: 'Report ID*',
          ),
          const SizedBox(
            height: 20,
          ),
          const RegularTextfield(
            hintText: 'Report Title',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomDateField(),
          const SizedBox(
            height: 20,
          ),
          const DescriptionTextfield(),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Expenses',
            style: AppTextStyle.kLargeBodyB.copyWith(
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: List<Widget>.generate(
              expenses.length,
              (index) => ExpensesCard(
                expenses: expenses[index],
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ExpenseDialog(),
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
