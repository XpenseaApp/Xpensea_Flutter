import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class CommonAppBarWback extends StatelessWidget {
  final int index;
  final String? heading;
  const CommonAppBarWback({super.key, required this.index, this.heading});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
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
              )
            else if (heading != null) ...[
              Text(
                heading!,
                style: AppTextStyle.kDisplayTitleM,
              ),
            ],
            InkWell(
              onTap: () {
                ref.invalidate(approversListProvider);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Transform.flip(
                    flipX: true, child: SvgPicture.asset(AppIcons.arrowRight)),
              ),
            ),
          ],
        );
      },
    );
  }
}
