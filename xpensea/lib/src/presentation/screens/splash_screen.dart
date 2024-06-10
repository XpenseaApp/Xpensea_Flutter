import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/presentation/theme/palette.dart';
import 'package:xpensea/src/presentation/theme/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.kPrimaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/star.svg'),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Expensea',
              style: AppTextStyle.kDisplayTitleR,
            )
          ],
        ),
      ),
    );
  }
}
