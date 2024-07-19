import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class Expenses {
  final String id;
  final String title;
  final String amount;
  final String date;
  final String leadingIconPath;
  late String trailingIconPath;

  Expenses({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.leadingIconPath,
    required this.trailingIconPath,
    required status,
  });

  factory Expenses.fromJson(Map<String, dynamic> json) {
    return Expenses(
      id: json['_id'],
      title: json['title'],
      amount: json['amount'].toString(),
      date: json['date'],
      status: json['status'],
      leadingIconPath: json['category'] == 'Food'
          ? AppIcons.expense
          : json['category'] == 'Travel'
              ? AppIcons.airplane
              : AppIcons.person,
      trailingIconPath:
          json['status'] == 'mapped' ? AppIcons.checkOk : AppIcons.checkWait,
    );
  }
}

class ExpensesCard extends StatelessWidget {
  final Expenses expenses;
  final VoidCallback? onSelect;
  final VoidCallback? onTap;
  const ExpensesCard({
    super.key,
    required this.expenses,
    this.onSelect,
    required this.onTap,
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
              InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: onSelect,
                  child: SvgPicture.asset(expenses.trailingIconPath)),
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
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
