import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/routes/routes.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, AppRoutes.otp);
  }

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.kPrimaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.star),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Xpensea',
              style: AppTextStyle.kDisplayTitleR,
            )
          ],
        ),
      ),
    );
  }
}
