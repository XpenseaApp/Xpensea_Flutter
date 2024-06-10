import 'package:flutter/material.dart';
import 'package:xpensea/src/presentation/theme/palette.dart';
import 'package:xpensea/src/presentation/theme/text_style.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              backgroundColor: AppPalette.kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: () {},
          child: Text(
            'GENERATE OTP',
            style: AppTextStyle.kSmallTitleR.copyWith(color: Colors.white),
          )),
    );
  }
}
