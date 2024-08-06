import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/dialogs/expense_dialoge.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class AiScores {
  final int authenticity;
  final int accuracy;
  final int compliance;
  final int completeness;
  final int relevance;

  AiScores({
    required this.authenticity,
    required this.accuracy,
    required this.compliance,
    required this.completeness,
    required this.relevance,
  });

  factory AiScores.fromJson(Map<String, dynamic> json) {
    return AiScores(
      authenticity: json['authenticity'],
      accuracy: json['accuracy'],
      compliance: json['compliance'],
      completeness: json['completeness'],
      relevance: json['relevance'],
    );
  }
}

class Expenses {
  final String? id;
  final String title;
  final String amount;
  final String? date;
  final String leadingIconPath;
  late String trailingIconPath;
  final String category;
  final String? description;
  final String image;
  final AiScores? aiScores;

  Expenses({
    this.id,
    required this.title,
    required this.amount,
    this.date,
    required this.leadingIconPath,
    required this.trailingIconPath,
    required status,
    required this.category,
    this.description,
    required this.image,
    this.aiScores,
  });

  factory Expenses.fromJson(Map<String, dynamic> json) {
    final aiScores =
        (json['aiScores'] != null && (json['aiScores'] as Map).isNotEmpty)
            ? AiScores.fromJson(json['aiScores'])
            : null;

    return Expenses(
      id: json['_id'],
      title: json['title'],
      amount: json['amount'].toString(),
      date: json['date'],
      status: json['status'],
      leadingIconPath: json['category'] == 'Food'
          ? AppIcons.food
          : json['category'] == 'Shopping'
              ? AppIcons.shopping
              : json['category'] == 'Miscellaneous'
                  ? AppIcons.miscellanenous
                  : json['category'] == 'Stay&Leisure'
                      ? AppIcons.stayandleisure
                      : json['category'] == 'Maintenance'
                          ? AppIcons.maintenance
                          : json['category'] == 'Travel'
                              ? AppIcons.airplane
                              : AppIcons.person,
      trailingIconPath:
          json['status'] == 'mapped' ? AppIcons.checkOk : AppIcons.checkWait,
      category: json['category'],
      description: json['description'],
      image: json['image'],
      aiScores: aiScores,
    );
  }
}

class ExpensesCard extends StatelessWidget {
  final Expenses expenses;
  final VoidCallback? onSelect;
  final VoidCallback? onTap;
  final bool? isSelected;
  const ExpensesCard({
    super.key,
    required this.expenses,
    this.onSelect,
    required this.onTap,
    this.isSelected,
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
                child: isSelected != null
                    ? isSelected!
                        ? SvgPicture.asset(AppIcons.checkOk)
                        : SvgPicture.asset(AppIcons.checkWait)
                    : SvgPicture.asset(expenses.trailingIconPath),
              ),
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
                expenses.date ?? '',
                style: AppTextStyle.kSmallTitleR
                    .copyWith(color: AppPalette.kGray3),
              )),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ExpenseDialog(id: expenses.id!),
                  );
                },
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
          ),
        ],
      ),
    );
  }
}
