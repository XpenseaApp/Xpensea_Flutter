import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/routes/routes.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CommonAppBar extends StatelessWidget {
  final int index;
  const CommonAppBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> response = {
      'status': 100,
      'message': 'No response',
      'data': {},
    };
    return Consumer(
      builder: (context, ref, child) {
        if (isTracking) {
          response = ref.watch(SaveLocationProvider('Work', '', token)).value ??
              response;
          log('Response: ${response.toString()}');
        }
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
            Row(
              children: [
                response['status'] != 200 && !isTracking
                    ? const SizedBox.shrink()
                    : GlowingProgressIndicator(
                        child: const Icon(Icons.location_on),
                      ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.notification);
                    },
                    child: SvgPicture.asset(AppIcons.notificationBell)),
              ],
            ),
          ],
        );
      },
    );
  }
}
