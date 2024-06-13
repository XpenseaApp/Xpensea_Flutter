import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: AppTextStyle.kSmallTitleR
            .copyWith(fontSize: 16, color: AppPalette.kGray4),
        suffixIcon: Container(
          padding: const EdgeInsets.all(8),
          height: 32,
          width: 32,
          child: SvgPicture.asset(
            AppIcons.search,
          ),
        ),
        // Search icon on the left
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        filled: true,
        fillColor: Colors.white, // Fill color of the TextField
        // contentPadding: const EdgeInsets.symmetric(
        //     vertical: 20, horizontal: 20), // Padding inside the TextField
      ),
    );
  }
}
