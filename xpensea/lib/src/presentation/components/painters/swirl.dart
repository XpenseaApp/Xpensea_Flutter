import 'package:flutter/material.dart';

class WavySwirlPainter extends CustomPainter {
  final double animationValue;

  WavySwirlPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true; // Ensure smooth edges with anti-aliasing

    // First Swirl (Top)
    final path1 = Path();
    path1.moveTo(-animationValue, size.height * 0.3);
    path1.quadraticBezierTo(
      size.width * 0.25 - animationValue,
      size.height * 0.2,
      size.width * 0.5 - animationValue,
      size.height * 0.3,
    );
    path1.quadraticBezierTo(
      size.width * 0.75 - animationValue,
      size.height * 0.4,
      size.width - animationValue,
      size.height * 0.3,
    );
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();

    canvas.drawPath(path1, paint);

    // Second Swirl (Bottom)
    final path2 = Path();
    path2.moveTo(size.width + animationValue, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width * 0.75 + animationValue,
      size.height * 0.8,
      size.width * 0.5 + animationValue,
      size.height * 0.7,
    );
    path2.quadraticBezierTo(
      size.width * 0.25 + animationValue,
      size.height * 0.6,
      0 + animationValue,
      size.height * 0.7,
    );
    path2.lineTo(0, size.height);
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(WavySwirlPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
