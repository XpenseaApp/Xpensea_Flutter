import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';

// Define the reportProvider and its associated methods

class CustomDateField extends ConsumerStatefulWidget {
  final String? hintText;
  final bool? isEditable;
  final bool? isdate;
  const CustomDateField({
    Key? key,
    this.hintText = 'Date',
    this.isEditable = true,
    this.isdate = true,
  }) : super(key: key);

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );

  @override
  ConsumerState<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends ConsumerState<CustomDateField> {
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      enabled: widget.isEditable,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.kSmallTitleR
            .copyWith(fontSize: 16, color: AppPalette.kGray4),
        suffixIcon: IconButton(
          onPressed: () => _presentDatePicker(widget.isdate!),
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.grey,
          ),
        ),
        border: CustomDateField._border,
        enabledBorder: CustomDateField._border,
        focusedBorder: CustomDateField._border,
        filled: true,
        fillColor: widget.isEditable != null && widget.isEditable!
            ? Colors.white
            : Colors.grey[200],
      ),
    );
  }

  void _presentDatePicker(bool isdate) async {
    if (isdate) {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null && pickedDate != selectedDate) {
        setState(() {
          selectedDate = pickedDate;
          dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
        });
        ref
            .read(reportProvider.notifier)
            .updateReportReportDate(dateController.text);
      }
    } else {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          final now = DateTime.now();
          final pickedDateTime = DateTime(
              now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
          dateController.text = DateFormat('HH:mm').format(pickedDateTime);
        });
      }
    }
  }
}
