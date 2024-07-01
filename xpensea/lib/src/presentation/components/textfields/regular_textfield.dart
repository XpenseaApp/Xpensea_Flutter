import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';

class RegularTextfield extends StatelessWidget {
  final String? hintText;
  final bool? isEditable;
  const RegularTextfield({
    super.key,
    this.hintText,
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
            ref.read(reportProvider.notifier).updateReportTitle(value);
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyle.kSmallTitleR
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
