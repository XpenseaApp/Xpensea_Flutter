import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/routes/routes.dart';

class CommonAppBar extends StatelessWidget {
  final int index;
  const CommonAppBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        if (index > 0)
          Text(
            index == 1
                ? 'Expenses'
                : index == 2
                    ? (approver ? 'Approval' : 'Reports')
                    : index == 3
                        ? (approver ? 'Reports' : '')
                        : '',
            style: AppTextStyle.kDisplayTitleM,
          ),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.debug);
            },
            child: SvgPicture.asset(AppIcons.notificationBell)),
      ],
    );
  }
}
