// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/components/checkbox/custom_checkbox.dart';
import 'package:xpensea/src/presentation/components/dropdown/single_dropdown.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/title_textfield.dart';

class BasicExpenseDetailPage extends StatelessWidget {
  const BasicExpenseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            TitleTextField(labelText: 'Time'),
            SizedBox(height: 12),
            TitleTextField(labelText: 'Date'),
            SizedBox(height: 12),
            TitleTextField(labelText: 'Location'),
            SizedBox(height: 12),
            TitleTextField(labelText: 'Expense Title'),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              child: SimpleDropdownWidget(
                hint: 'Expense Category',
                items: [
                  'Shopping',
                  'Travel',
                  'Shop Expenses',
                  'Stay & Leisure',
                  'Maintenance',
                  'Food',
                ],
              ),
            ),
            SizedBox(height: 12),
            TitleTextField(labelText: 'Amount'),
            SizedBox(height: 20),
            DescriptionTextfield(),
          ],
        ),
      ),
    );
  }
}
