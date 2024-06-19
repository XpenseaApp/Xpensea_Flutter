import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class DescriptionTextfield extends StatefulWidget {
  const DescriptionTextfield({super.key});

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );

  @override
  State<DescriptionTextfield> createState() => _DescriptionTextfieldState();
}

class _DescriptionTextfieldState extends State<DescriptionTextfield> {
  final TextEditingController _controller = TextEditingController();

  final int maxWords = 500;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    List<String> words = _controller.text.split(RegExp(r'\s+'));
    if (words.length > maxWords) {
      _controller.text = words.sublist(0, maxWords).join(" ");
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 7,
      decoration: InputDecoration(
        hintText: "Write a description in less than 500 words",
        hintStyle: AppTextStyle.kSmallTitleR
            .copyWith(fontSize: 16, color: AppPalette.kGray4),

        border: DescriptionTextfield._border,
        enabledBorder: DescriptionTextfield._border,
        focusedBorder: DescriptionTextfield._border,
        filled: true,
        fillColor: Colors.white, // Fill color of the TextField
      ),
    );
  }
}
