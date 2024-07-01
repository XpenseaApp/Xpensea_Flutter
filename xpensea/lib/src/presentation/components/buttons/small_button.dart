import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SmallButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: AppPalette.kPrimaryColor,
            borderRadius: BorderRadius.circular(4)),
        child: Text(
          text,
          style: AppTextStyle.kSmallBodySB
              .copyWith(fontSize: 8, color: Colors.white),
        ),
      ),
    );
  }
}
