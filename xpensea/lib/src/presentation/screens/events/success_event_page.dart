import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class SuccessEventPage extends StatelessWidget {
  const SuccessEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppIcons.successCheck),
        const Text(
          'Your Event Report #EXP123\nSaved Successfully ',
          textAlign: TextAlign.center,
          style: AppTextStyle.kLargeBodySB,
        ),
      ],
    );
  }
}
