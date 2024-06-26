import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
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
                  'Filter',
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
              'Sort',
              style: AppTextStyle.kLargeBodySB.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: List<Widget>.generate(
                options.length,
                (index) {
                  return ChoiceChip(
                    selectedColor: AppPalette.kLSelectedColor,
                    label: Text(options[index]),
                    selected: selectedOption == options[index],
                    onSelected: (bool selected) {
                      setState(() {
                        selectedOption = selected ? options[index] : null;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Choose Date',
              style: AppTextStyle.kLargeBodySB.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            const CustomDateField(),
            const SizedBox(
              height: 32,
            ),
            SolidButton(
              onPressed: () {},
              text: "APPLY",
            ),
            SolidButton(
              onPressed: () {},
              text: "RESET",
              backgroundColor: AppPalette.kWhiteBtn,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
