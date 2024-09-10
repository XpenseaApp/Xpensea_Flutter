import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/event.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/presentation/components/textfields/date_field.dart';
import 'package:xpensea/src/presentation/components/textfields/description_textfield.dart';
import 'package:xpensea/src/presentation/components/textfields/title_textfield.dart';

class BasicEventDetailPage extends StatefulWidget {
  const BasicEventDetailPage({super.key});

  @override
  _BasicEventDetailPageState createState() => _BasicEventDetailPageState();
}

class _BasicEventDetailPageState extends State<BasicEventDetailPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
              ),
              const TitleTextField(
                labelText: 'Event Title',
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                        eventCheckbox = isChecked;
                        if (isChecked) {
                          ref.read(eventProvider.notifier).updateEventStartDate(
                              DateFormat('yyyy-MM-dd').format(DateTime.now()));
                          ref
                              .read(eventProvider.notifier)
                              .updateEventStartTime(DateTime.now().toString());

                          ref
                              .read(eventProvider.notifier)
                              .updateEventStatus("progress");
                          log('event status: ${ref.read(eventProvider).status}');
                        } else {
                          ref
                              .read(eventProvider.notifier)
                              .updateEventStatus("scheduled");
                        }
                      });
                    },
                  ),
                  Text(
                    'Effective immediately',
                    style: AppTextStyle.kSmallBodySB
                        .copyWith(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              CustomDateField(
                hintText: 'Start date',
                isEditable: !isChecked,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDateField(
                hintText: 'Start Time',
                isdate: false,
                isEditable: !isChecked,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomDateField(
                hintText: 'End date',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomDateField(
                hintText: 'End time',
                isdate: false,
              ),
              const SizedBox(
                height: 20,
              ),
              const DescriptionTextfield(
                type: 'event',
              ),
            ],
          ),
        );
      },
    );
  }
}
