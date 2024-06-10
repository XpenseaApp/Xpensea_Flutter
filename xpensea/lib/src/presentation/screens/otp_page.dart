import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/icons/app_icons.dart';
import 'package:xpensea/src/presentation/theme/palette.dart';
import 'package:xpensea/src/presentation/theme/text_style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.starFilled),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your Phone number",
                style: AppTextStyle.kDisplayTitleM,
              ),
              const Text(
                "We will send you the 4 digit Verification code",
                style: AppTextStyle.kSmallTitleR,
              ),
              const Spacer(),
              const SolidButton()
            ],
          ),
        ),
      ),
    );
  }
}
