import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class MenuCard extends StatelessWidget {
  final String text;
  final String iconPath;
  const MenuCard({
    super.key,
    required this.text,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppPalette.kSeaShell),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: AppTextStyle.kBodySB,
          )
        ],
      ),
    );
  }
}
