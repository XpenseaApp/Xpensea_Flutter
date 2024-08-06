import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/event.dart';
import 'package:xpensea/src/data/models/expense.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/repos/location.dart';

class TitleTextField extends StatelessWidget {
  final String? labelText;
  final bool? isEditable;
  const TitleTextField({
    super.key,
    this.labelText,
    this.isEditable = true,
  });

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return TextField(
          enabled: isEditable,
          onChanged: (value) {
            switch (labelText) {
              case 'Expense Title':
                ref.read(expenseProvider.notifier).updateExpenseTitle(value);
                break;
              case 'Amount':
                ref
                    .read(expenseProvider.notifier)
                    .updateExpenseAmount(double.parse(value));
                break;
              case 'Event Title':
                ref.read(eventProvider.notifier).updateEventName(value);
                break;

              default:
                break;
            }
          },
          decoration: InputDecoration(
            labelText: labelText == 'Time'
                ? DateFormat('HH:mm:ss').format(DateTime.now())
                : labelText == 'Date'
                    ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                    : labelText == 'Location'
                        //TODO: add location
                        ? location != null
                            ? '${location!.latitude}, ${location!.longitude}'
                            : 'Location not available'
                        : labelText,
            labelStyle: AppTextStyle.kSmallTitleR
                .copyWith(fontSize: 16, color: AppPalette.kGray4),

            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
            filled: true,
            fillColor: Colors.white, // Fill color of the TextField
          ),
        );
      },
    );
  }
}
