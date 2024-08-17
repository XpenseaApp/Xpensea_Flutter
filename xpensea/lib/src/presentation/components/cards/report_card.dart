import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/routes/routes.dart';
import 'package:xpensea/src/presentation/screens/approver/approval_details.dart';

class Reports {
  final String id;
  final String title;
  final String amount;
  final String expenses;
  final String date;
  final String leadingIconPath;
  String? status;
  Color? statusColor;
  Color? statusTextColor;
  String? reportId;
  String? description;
  List<String>? expenseIds;
  String? userId;
  String? type;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? userDetails;
  Map<String, dynamic>? tierDetails;

  Reports({
    required this.id,
    required this.title,
    required this.amount,
    required this.expenses,
    required this.date,
    required this.leadingIconPath,
    this.status,
    this.statusColor,
    this.statusTextColor,
    this.reportId,
    this.description,
    this.expenseIds,
    this.userId,
    this.type,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.userDetails,
    this.tierDetails,
  });

  factory Reports.fromJson(Map<String, dynamic> json) {
    return Reports(
      id: json['_id'],
      title: json['title'] ?? json['reportId'] ?? 'Unknown Title',
      amount: json.containsKey('totalAmount')
          ? json['totalAmount'].toString()
          : json['tierDetails']?['totalAmount']?.toString() ?? '0',
      expenses: json.containsKey('expenseCount')
          ? json['expenseCount'].toString()
          : json['expenses']?.length.toString() ?? '0',
      date: json['date'] ?? json['reportDate'] ?? 'Unknown Date',
      leadingIconPath: json['leadingIconPath'] ?? AppIcons.report,
      status: json['status'],
      statusColor: Color.fromARGB(255, 249, 249, 249),
      statusTextColor: json['status'] == 'approved'
          ? Color.fromARGB(255, 20, 174, 92)
          : json['status'] == 'rejected'
              ? const Color.fromARGB(255, 224, 13, 0)
              : json['status'] == 'reimbursed'
                  ? const Color.fromARGB(255, 7, 30, 65)
                  : json['status'] == 'pending'
                      ? const Color.fromARGB(255, 255, 166, 41)
                      : Colors.black,
      reportId: json['_id'],
      description: json['description'],
      expenseIds: json['expenses'] != null
          ? (json['expenses'] as List<dynamic>)
              .map((expense) => expense.toString())
              .toList()
          : null,
      userId: json['user'],
      type: json['type'],
      location: json['location'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      userDetails: json['userDetails'],
      tierDetails: json['tierDetails'],
    );
  }
}

class ReportCard extends StatelessWidget {
  final Reports report;
  final bool isReport;
  const ReportCard({
    super.key,
    required this.report,
    this.isReport = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
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
                          color: report.statusColor,
                          border: Border.all(
                              color: report.statusTextColor ?? Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                        report.status == 'pending'
                            ? 'Submitted'
                            : report.status!,
                        style: AppTextStyle.kSmallBodyR.copyWith(
                          color: report.statusTextColor,
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
                    report.date.split('T').first,
                    style: AppTextStyle.kSmallTitleR
                        .copyWith(color: AppPalette.kGray3),
                  )),
                  InkWell(
                    onTap: () {
                      ref.watch(selectedExpensesProvider).clear();

                      if (isReport) {
                        Navigator.pushNamed(context, AppRoutes.reportDetails,
                            arguments: {'id': report.id});
                      } else {
                        Navigator.pushNamed(context, AppRoutes.approvalDetails,
                            arguments: {'id': report.id});
                      }
                    },
                    child: Text(
                      'View More',
                      style: AppTextStyle.kSmallBodySB.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 29, 32, 35)),
                    ),
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
      },
    );
  }
}
