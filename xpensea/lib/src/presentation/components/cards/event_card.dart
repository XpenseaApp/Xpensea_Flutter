import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/buttons/small_button.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:xpensea/src/presentation/components/steppers/cutsom_stepper.dart';
import 'package:xpensea/src/presentation/routes/routes.dart';

class EventCard extends StatelessWidget {
  final String id;
  final DateTime startDate;
  final DateTime endDate;

  const EventCard({
    super.key,
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  double _calculatePercentage() {
    final now = DateTime.now();
    if (now.isBefore(startDate)) {
      return 0;
    } else if (now.isAfter(endDate)) {
      return 100;
    } else {
      final totalDuration = endDate.difference(startDate).inMinutes;
      final elapsedDuration = now.difference(startDate).inMinutes;
      return (elapsedDuration / totalDuration) * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _calculatePercentage().clamp(0, 100).toInt();

    return Consumer(
      builder: (context, ref, child) {
        final report = ref.watch(getReportProvider(id, 'true', token)).value;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: const BoxDecoration(
            color: AppPalette.kSeaShell,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Event Progress',
                style: AppTextStyle.kSmallBodySB.copyWith(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$percentage% to complete',
                      style: AppTextStyle.kSmallBodySB
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Icon(
                    Icons.watch_later_outlined,
                    size: 8,
                  ),
                  Text(
                    '${(endDate.difference(DateTime.now()).inMinutes).clamp(0, endDate.difference(startDate).inMinutes)}min',
                    style: AppTextStyle.kSmallBodySB.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 8,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              CustomStepper(percentage: percentage),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start date',
                          style: AppTextStyle.kSmallBodySB.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Colors.black)),
                      Text(
                        '${startDate.day}/${startDate.month}/${startDate.year}',
                        style: AppTextStyle.kLargeBodyB.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End date',
                          style: AppTextStyle.kSmallBodySB.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Colors.black)),
                      Text(
                        '${endDate.day}/${endDate.month}/${endDate.year}',
                        style: AppTextStyle.kLargeBodyB.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  SmallButton(
                    text: 'Add Expense',
                    onTap: () async {
                      // await Future.delayed(const Duration(seconds: 3));
                      print("report " + report.toString());
                      await Navigator.pushNamed(
                          context, AppRoutes.reportDetails,
                          arguments: {'id': report['_id']});
                    },
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
