import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class CustomOutLineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color outLineColor;
  final Color textColor;

  const CustomOutLineButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.outLineColor = AppPalette.kPrimaryColor,
    this.textColor = AppPalette.kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              side: BorderSide(width: 2, color: outLineColor),
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(
            text,
            style: AppTextStyle.kLargeBodyB.copyWith(
              fontSize: 16,
              color: textColor,
            ),
          )),
    );
  }
}
