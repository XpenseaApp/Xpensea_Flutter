import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // Add intl for date/time parsing
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/steppers/cutsom_stepper.dart';
import 'package:xpensea/src/presentation/screens/routes/routes.dart';

class EventCard extends StatelessWidget {
  final String id;
  final String Name;
  final DateTime startDate;
  final DateTime endDate;
  final String endtime;
  final String type;

  const EventCard({
    super.key,
    required this.id,
    required this.Name,
    required this.startDate,
    required this.endDate,
    required this.endtime,
    required this.type,
  });

  double _calculatePercentage() {
    final now = DateTime.now();
    final endTimeDateTime = _parseEndTime(endDate, endtime);

    if (now.isBefore(startDate)) {
      return 0;
    } else if (now.isAfter(endTimeDateTime)) {
      return 100;
    } else {
      final totalDuration = endTimeDateTime.difference(startDate).inMinutes;
      final elapsedDuration = now.difference(startDate).inMinutes;
      return (elapsedDuration / totalDuration) * 100;
    }
  }

  DateTime _parseEndTime(DateTime endDate, String endtime) {
    // Combine endDate with endtime to get the full DateTime object
    final formattedEndTime =
        DateFormat('hh:mm a').parse(endtime); // Parse the time
    return DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      formattedEndTime.hour,
      formattedEndTime.minute,
    );
  }

  int _getTimeLeftInMinutes() {
    final now = DateTime.now();
    final endTimeDateTime = _parseEndTime(endDate, endtime);
    final differenceInMinutes = endTimeDateTime.difference(now).inMinutes;
    return differenceInMinutes.clamp(
        0, endTimeDateTime.difference(startDate).inMinutes);
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _calculatePercentage().clamp(0, 100).toInt();

    return Consumer(
      builder: (context, ref, child) {
        final report = ref.watch(getReportProvider(id, 'true', token)).value;
        return Container(
          height: 200, // Adjust the height as needed
          width: double.infinity, // Ensures the container takes full width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3, // Top 3/4th section
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              Name,
                              style: AppTextStyle.kLargeBodyB.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis, // Avoid overflow
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              type == 'User'
                                  ? 'PERSONAL EVENT'
                                  : 'GLOBAL EVENT',
                              style: AppTextStyle.kSmallBodySB.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              overflow: TextOverflow.ellipsis, // Avoid overflow
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '$percentage% to complete',
                              style: AppTextStyle.kSmallBodySB.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                              overflow: TextOverflow.ellipsis, // Avoid overflow
                            ),
                          ),
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 16,
                            color: Colors.grey,
                          ),
                          Text(
                            '${_getTimeLeftInMinutes()} min',
                            style: AppTextStyle.kSmallBodySB.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis, // Avoid overflow
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomStepper(percentage: percentage),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ENDING ON',
                                style: AppTextStyle.kSmallBodySB.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                          color: Colors.green.shade700,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${startDate.day.toString().padLeft(2, '0')} ${_getMonthName(startDate.month)} ${startDate.year}',
                                          style: AppTextStyle.kSmallBodySB
                                              .copyWith(
                                            fontSize: 12,
                                            color: Colors.green.shade700,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Avoid overflow
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 12,
                                          color: Colors.blue.shade700,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          endtime,
                                          style: AppTextStyle.kSmallBodySB
                                              .copyWith(
                                            fontSize: 12,
                                            color: Colors.blue.shade700,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Avoid overflow
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1, // Bottom 1/4th section
                child: ElevatedButton(
                  onPressed: () async {
                    print("report $report");
                    await Navigator.pushNamed(
                      context,
                      AppRoutes.reportDetails,
                      arguments: {'id': report['_id']},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add Expense',
                      style: AppTextStyle.kSmallBodySB.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis, // Avoid overflow
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getMonthName(int month) {
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return months[month - 1];
  }
}
