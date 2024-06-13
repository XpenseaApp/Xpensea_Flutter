import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class Expenses {
  final String title;
  final String amount;
  final String date;
  final String leadingIconPath;
  final String trailingIconPath;

  Expenses({
    required this.title,
    required this.amount,
    required this.date,
    required this.leadingIconPath,
    required this.trailingIconPath,
  });
}

class ExpensesCard extends StatelessWidget {
  final Expenses expenses;
  const ExpensesCard({
    super.key,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // icon
              SvgPicture.asset(expenses.leadingIconPath),

              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expenses.title,
                      style: AppTextStyle.kMediumBodyM,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      expenses.amount,
                      style: AppTextStyle.kLargeBodySB,
                    ),
                  ],
                ),
              ),
              // status
              SvgPicture.asset(expenses.trailingIconPath),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                expenses.date,
                style: AppTextStyle.kSmallTitleR
                    .copyWith(color: AppPalette.kGray3),
              )),
              Text(
                'View More',
                style: AppTextStyle.kSmallBodySB
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 4,
              ),
              SvgPicture.asset(AppIcons.arrowForward)
            ],
          )
        ],
      ),
    );
  }
}
