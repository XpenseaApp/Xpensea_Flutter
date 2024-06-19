import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class CustomDateField extends StatefulWidget {
  const CustomDateField({super.key});

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      decoration: InputDecoration(
        hintText: 'Date',
        hintStyle: AppTextStyle.kSmallTitleR
            .copyWith(fontSize: 16, color: AppPalette.kGray4),

        suffixIcon: IconButton(
          onPressed: _presentDatePicker,
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.grey,
          ),
        ),
        // Search icon on the left
        border: CustomDateField._border,
        enabledBorder: CustomDateField._border,
        focusedBorder: CustomDateField._border,
        filled: true,
        fillColor: Colors.white, // Fill color of the TextField
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
      });
    }
  }
}
