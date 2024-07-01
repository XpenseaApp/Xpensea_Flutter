import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class Reports {
  final String title;
  final String amount;
  final String expenses;
  final String date;
  final String leadingIconPath;
  String? status;
  Color? statusColor;
  Color? statusTextColor;

  Reports({
    required this.title,
    required this.amount,
    required this.expenses,
    required this.date,
    required this.leadingIconPath,
    this.status,
    this.statusColor,
    this.statusTextColor,
  });

  factory Reports.fromJson(Map<String, dynamic> json) {
    return Reports(
      title: json['title'],
      amount: json['totalAmount'].toString(),
      expenses: json['expenseCount'].toString(),
      date: json['date'],
      leadingIconPath: json['leadingIconPath'] ?? AppIcons.person,
      status: json['status'],
      statusColor: json['statusColor'] ?? Colors.grey,
      statusTextColor: json['statusTextColor'] ?? Colors.black,
    );
  }
}

class ReportCard extends StatelessWidget {
  final Reports report;
  const ReportCard({
    super.key,
    required this.report,
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
              SvgPicture.asset(report.leadingIconPath),

              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.title,
                      style: AppTextStyle.kMediumBodyM,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          report.amount,
                          style: AppTextStyle.kLargeBodySB,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          report.expenses,
                          style: AppTextStyle.kSmallBodyR,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // status
              if (report.status != null)
                Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      color: report.statusColor ?? Colors.grey,
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                      child: Text(
                    report.status!,
                    style: AppTextStyle.kSmallBodyR.copyWith(
                      color: report.statusTextColor ?? Colors.black,
                    ),
                  )),
                )
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
                report.date,
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
