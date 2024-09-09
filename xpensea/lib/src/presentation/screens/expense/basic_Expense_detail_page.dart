// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/checkbox/custom_checkbox.dart';
import 'package:xpensea/src/presentation/components/dropdown/single_dropdown.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/title_textfield.dart';

class BasicExpenseDetailPage extends StatelessWidget {
  const BasicExpenseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<String> expenseCategories =
            ref.watch(GetCatagoriesProvider(token)).value ?? [];
        print(expenseCategories);
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                TitleTextField(
                  labelText: 'Time',
                  isEditable: false,
                ),
                SizedBox(height: 12),
                TitleTextField(
                  labelText: 'Date',
                  isEditable: false,
                ),
                SizedBox(height: 12),
                TitleTextField(
                  labelText: 'Location',
                  isEditable: false,
                ),
                SizedBox(height: 12),
                TitleTextField(labelText: 'Expense Title'),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: SimpleDropdownWidget(
                      hint: 'Expense Category', items: expenseCategories),
                ),
                SizedBox(height: 12),
                TitleTextField(labelText: 'Amount'),
                SizedBox(height: 20),
                DescriptionTextfield(
                  type: 'expense',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
