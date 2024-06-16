import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class SolidButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SolidButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0.0),
            backgroundColor: AppPalette.kPrimaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyle.kSmallTitleR.copyWith(
              color: Colors.white,
            ),
          )),
    );
  }
}
