import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/expense.dart';
import 'package:xpensea/src/data/models/report.dart';

class DescriptionTextfield extends StatefulWidget {
  final bool? isEditable; // Add the isEditable parameter
  final String? hintText;
  final String? type;

  const DescriptionTextfield(
      {Key? key, this.isEditable, this.hintText, required this.type})
      : super(key: key);

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );

  @override
  State<DescriptionTextfield> createState() => _DescriptionTextfieldState();
}

class _DescriptionTextfieldState extends State<DescriptionTextfield> {
  final int maxWords = 500;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditable = widget.isEditable ?? true;
    return Consumer(
      builder: (context, ref, child) {
        return TextField(
          enabled: isEditable,
          onChanged: (value) {
            switch (widget.type) {
              case 'expense':
                ref
                    .read(expenseProvider.notifier)
                    .updateExpenseDescription(value);
                break;
              case 'report':
                ref
                    .read(reportProvider.notifier)
                    .updateReportDescription(value);
                break;
              default:
                break;
            }
          },
          maxLines: 7,
          decoration: InputDecoration(
            hintText:
                widget.hintText ?? "Write a description in less than 500 words",
            hintStyle: AppTextStyle.kSmallTitleR
                .copyWith(fontSize: 16, color: AppPalette.kGray4),

            border: DescriptionTextfield._border,
            enabledBorder: DescriptionTextfield._border,
            focusedBorder: DescriptionTextfield._border,
            filled: true,
            fillColor: Colors.white, // Fill color of the TextField
          ),
        );
      },
    );
  }
}
