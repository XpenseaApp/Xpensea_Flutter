import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/dropdown/single_dropdown.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';

class ReportProblemDialog extends StatefulWidget {
  const ReportProblemDialog({super.key});

  @override
  State<ReportProblemDialog> createState() => _ReportProblemDialogState();
}

class _ReportProblemDialogState extends State<ReportProblemDialog> {
  String? selectedOption;

  final List<String> options = [
    'Newest First',
    'Oldest First',
    'This Month',
    'Last Month',
    'This Week',
    'Last Week',
    'Today'
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Report a problem',
                  style: AppTextStyle.kLargeBodySB,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'To',
              style: AppTextStyle.kLargeBodySB.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            const SimpleDropdownWidget(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Description',
              style: AppTextStyle.kLargeBodySB.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            const DescriptionTextfield(),
            const SizedBox(
              height: 32,
            ),
            SolidButton(
              onPressed: () {},
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
