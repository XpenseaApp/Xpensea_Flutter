import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/components/painters/swirl.dart';
import 'package:xpensea/src/presentation/screens/routes/routes.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:motion/motion.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _swirlAnimation;

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, AppRoutes.otp);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _swirlAnimation = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);

    _navigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.kPrimaryColor,
      body: Stack(
        children: [
          // Animated wavy swirl background
          AnimatedBuilder(
            animation: _swirlAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: WavySwirlPainter(
                  _swirlAnimation.value,
                ),
              );
            },
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Motion(
                glare: null,
                filterQuality: FilterQuality.high,
                shadow: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.star),
                    const SizedBox(width: 10),
                    const Text(
                      'Xpensea',
                      style: AppTextStyle.kDisplayTitleR,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
