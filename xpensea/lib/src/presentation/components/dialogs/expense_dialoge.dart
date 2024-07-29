import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';

class ExpenseDialog extends StatelessWidget {
  final String id;
  const ExpenseDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final Expenses? expense = ref
                .watch(getExpenseProvider(id, token))
                .value ??
            Expenses(
              id: id,
              title:
                  ref.watch(getExpenseProvider(id, token)).value?.title ?? '',
              amount: ref
                      .watch(getExpenseProvider(id, token))
                      .value
                      ?.amount
                      .toString() ??
                  '',
              date: ref.watch(getExpenseProvider(id, token)).value?.date ?? '',
              leadingIconPath: ref
                      .watch(getExpenseProvider(id, token))
                      .value
                      ?.leadingIconPath ??
                  '',
              trailingIconPath: ref
                      .watch(getExpenseProvider(id, token))
                      .value
                      ?.trailingIconPath ??
                  '',
              status: '',
              category:
                  ref.watch(getExpenseProvider(id, token)).value?.category ??
                      '',
              description:
                  ref.watch(getExpenseProvider(id, token)).value?.description ??
                      '',
              image:
                  ref.watch(getExpenseProvider(id, token)).value?.image ?? '',
            );

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: const EdgeInsets.all(12),
          child: Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${expense?.category} Expense',
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
                      expense!.title,
                      style: AppTextStyle.kLargeBodySB.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Text(
                      expense.date ?? '',
                      style: AppTextStyle.kSmallTitleR
                          .copyWith(fontSize: 18, color: AppPalette.kGray3),
                    ),
                  ],
                ),
                Text(expense.amount, style: AppTextStyle.kPrimaryColorText),
                const Divider(),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppPalette.kGray5,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Image.network(
                          expense.image != ''
                              ? expense.image
                              : 'https://via.placeholder.com/150',
                          width: 50,
                          height: 50),
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
                Text(
                  expense.description ?? '',
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
      },
    );
  }
}
