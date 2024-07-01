import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class MenuCard extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onTap;
  const MenuCard({
    super.key,
    required this.text,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        decoration: const BoxDecoration(
            color: AppPalette.kSeaShell,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: AppTextStyle.kSmallBodySB,
            )
          ],
        ),
      ),
    );
  }
}
