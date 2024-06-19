import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/buttons/outline_button.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/regular_textfield.dart';

class CreateReport extends StatelessWidget {
  const CreateReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.starFilled),
                SvgPicture.asset(AppIcons.notificationBell),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Create\nExpense Report',
              style: AppTextStyle.kDisplayTitleM,
            ),
            Text(
              'Basic Report',
              style: AppTextStyle.kLargeBodyB.copyWith(
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            const RegularTextfield(
              hintText: 'Report Title',
            ),
            const CustomDateField(),
            const DescriptionTextfield(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomOutLineButton(
                    text: 'Home',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 1, child: SolidButton(onPressed: () {}, text: 'Next'))
              ],
            )
          ],
        ),
      )),
    );
  }
}
