import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/buttons/small_button.dart';
import 'package:xpensea/src/presentation/components/steppers/cutsom_stepper.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                  '25% to complete',
                  style: AppTextStyle.kSmallBodySB
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const Icon(
                Icons.watch_later_outlined,
                size: 8,
              ),
              Text('39min',
                  style: AppTextStyle.kSmallBodySB.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                      color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const CustomStepper(percentage: 25),
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
                    '25/08/2024',
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
                    '26/08/2024',
                    style: AppTextStyle.kLargeBodyB.copyWith(fontSize: 12),
                  ),
                ],
              ),
              SmallButton(
                text: 'Add Expense',
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
