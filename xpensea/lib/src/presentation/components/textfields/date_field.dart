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
  const CustomDateField({
    Key? key,
    this.hintText = 'Date',
    this.isEditable = true,
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
          onPressed: _presentDatePicker,
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.grey,
          ),
        ),
        border: CustomDateField._border,
        enabledBorder: CustomDateField._border,
        focusedBorder: CustomDateField._border,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  void _presentDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
        print(dateController.text);
      });
      ref
          .read(reportProvider.notifier)
          .updateReportReportDate(dateController.text);
    }
  }
}
