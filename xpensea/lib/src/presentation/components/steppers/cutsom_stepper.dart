import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int percentage;

  const CustomStepper({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    // Total width of the progress bar
    double width = 300;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: width * (percentage / 100),
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
