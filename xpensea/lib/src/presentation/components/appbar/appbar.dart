import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class CommonAppBar extends StatelessWidget {
  final int index;
  const CommonAppBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        if (index == 1 || index == 2)
          Text(
            index == 1 ? 'Expenses' : 'Reports',
            style: AppTextStyle.kDisplayTitleM,
          ),
        SvgPicture.asset(AppIcons.notificationBell),
      ],
    );
  }
}
