import 'package:flutter/material.dart';

class ReportStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ReportStepper(
      {super.key, required this.currentStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            List.generate(totalSteps, (index) => buildStep(index, context)),
      ),
    );
  }

  Widget buildStep(int index, BuildContext context) {
    bool isCompleted = index < currentStep;
    bool isCurrent = index == currentStep;

    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              if (index > 0)
                Expanded(
                  child: Divider(
                    color: isCompleted || isCurrent ? Colors.red : Colors.grey,
                    thickness: 2,
                  ),
                ),
              CircleAvatar(
                radius: 20,
                backgroundColor: isCurrent
                    ? Colors.red
                    : isCompleted
                        ? Colors.red
                        : Colors.grey,
                child: isCompleted || isCurrent
                    ? const Icon(Icons.check, color: Colors.white)
                    : Container(),
              ),
              if (index < totalSteps - 1)
                Expanded(
                  child: Divider(
                    color: isCurrent ? Colors.red : Colors.grey,
                    thickness: 2,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              ['Basic Details', 'Expenses', 'Preview'][index],
              style: TextStyle(color: isCurrent ? Colors.red : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
