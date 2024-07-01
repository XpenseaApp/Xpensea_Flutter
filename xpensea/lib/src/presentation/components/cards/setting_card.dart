import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class SettingParams {
  final String leadingImagePath;
  final String title;
  final VoidCallback? onTap;

  SettingParams({
    required this.leadingImagePath,
    required this.title,
    this.onTap,
  });
}

class SettingCard extends StatelessWidget {
  final SettingParams settingParams;
  const SettingCard({super.key, required this.settingParams});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: settingParams.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(settingParams.leadingImagePath),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                settingParams.title,
                style: AppTextStyle.kLargeBodySB
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            SvgPicture.asset(AppIcons.arrowRight),
          ],
        ),
      ),
    );
  }
}
