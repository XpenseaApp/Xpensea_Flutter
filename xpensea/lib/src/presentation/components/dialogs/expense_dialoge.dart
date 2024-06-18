import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class ExpenseDialog extends StatelessWidget {
  const ExpenseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Expense',
                  style: AppTextStyle.kLargeBodySB,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flower Expense',
                  style: AppTextStyle.kLargeBodySB.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Text(
                  'Nov 19 2023',
                  style: AppTextStyle.kSmallTitleR
                      .copyWith(fontSize: 18, color: AppPalette.kGray3),
                ),
              ],
            ),
            const Text('Rs 401', style: AppTextStyle.kPrimaryColorText),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  color: AppPalette.kGray5,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Text('image'),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ImgQR25245-11/02/2024',
                        style: AppTextStyle.kLargeBodySB
                            .copyWith(fontSize: 15, color: Colors.black),
                      ),
                      Text('92kb',
                          style: AppTextStyle.kLargeBodySB
                              .copyWith(fontSize: 15, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: AppTextStyle.kSmallTitleR,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('image'),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Flower Market',
                        style: AppTextStyle.kLargeBodySB
                            .copyWith(fontSize: 15, color: Colors.grey)),
                    Text('404, Aluva',
                        style: AppTextStyle.kLargeBodySB
                            .copyWith(fontSize: 15, color: Colors.grey)),
                    Text('Ernakulam',
                        style: AppTextStyle.kLargeBodySB
                            .copyWith(fontSize: 15, color: Colors.grey))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
