import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final int score;

  const ScoreCircle({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: score == 0
            ? Icon(
                Icons.close,
                color: Colors.red,
                size: 24,
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: score / 10,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.lerp(Colors.red, Colors.green, score / 10)!,
                    ),
                    backgroundColor: Colors.grey[200],
                    strokeWidth: 4.0,
                  ),
                  Center(
                    child: Text(
                      '$score',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
