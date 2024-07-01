import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class CustomCheckBox extends StatefulWidget {
  final String label;
  const CustomCheckBox({super.key, required this.label});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Text(
          widget.label,
          style: AppTextStyle.kSmallBodySB.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}
