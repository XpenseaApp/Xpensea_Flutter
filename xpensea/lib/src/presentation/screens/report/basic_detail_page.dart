import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/buttons/outline_button.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/regular_textfield.dart';

class BasicDetailPage extends StatelessWidget {
  const BasicDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Basic Details',
            style: AppTextStyle.kLargeBodyB.copyWith(
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
          ),
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
      ],
    );
  }
}
