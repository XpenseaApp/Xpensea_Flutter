import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/regular_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/title_textfield.dart';
import 'package:xpensea/src/presentation/screens/report/expenses_list_page.dart';

class PreviewReport extends StatelessWidget {
  const PreviewReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final List<Expenses> expenses = ref.watch(expensesProvider) ?? [];
        final String title = ref.watch(reportProvider).title;
        final String date = ref.read(reportProvider).reportDate;
        final String description = ref.watch(reportProvider).description;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Basic Details',
                    style: AppTextStyle.kLargeBodyB.copyWith(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.edit),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Edit',
                        style: AppTextStyle.kMediumBodyM
                            .copyWith(color: AppPalette.kSuccess),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RegularTextfield(
                hintText: title,
                isEditable: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDateField(
                hintText: date,
                isEditable: false,
              ),
              const SizedBox(
                height: 20,
              ),
              DescriptionTextfield(
                type: 'report',
                hintText: description,
                isEditable: false,
              ),
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
                        builder: (context) => ExpenseDialog(
                            id: expenses.elementAtOrNull(index)!.id!),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
