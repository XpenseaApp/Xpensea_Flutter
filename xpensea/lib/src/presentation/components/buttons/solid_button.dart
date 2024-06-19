import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class SolidButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const SolidButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppPalette.kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0.0),
            backgroundColor: backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyle.kSmallTitleR.copyWith(
              color: textColor,
            ),
          )),
    );
  }
}
