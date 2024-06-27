import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/components/checkbox/custom_checkbox.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/title_textfield.dart';

class BasicEventDetailPage extends StatelessWidget {
  const BasicEventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4,
        ),
        TitleTextField(
          labelText: 'Expense Title',
        ),
        SizedBox(
          height: 12,
        ),
        CustomCheckBox(label: 'Effective immediately'),
        SizedBox(
          height: 12,
        ),
        CustomDateField(
          hintText: 'Start date',
        ),
        SizedBox(
          height: 20,
        ),
        CustomDateField(
          hintText: 'End date',
        ),
        SizedBox(
          height: 20,
        ),
        DescriptionTextfield(),
      ],
    );
  }
}
