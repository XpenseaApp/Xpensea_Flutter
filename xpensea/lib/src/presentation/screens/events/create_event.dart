import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/event.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/data/routes/user_api_routes.dart';
import 'package:xpensea/src/presentation/components/buttons/outline_button.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/events/basic_event_detail_page.dart';
import 'package:xpensea/src/presentation/screens/events/event_list_page.dart';
import 'package:xpensea/src/presentation/screens/events/success_event_page.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> pages = [const BasicEventDetailPage(), const SuccessEventPage()];

  final List<String> pageTitles = ['Create\nEvent', 'Event'];

  Map<int, String> buttonTexts = {};

  String getPageText() {
    return pageTitles[_currentPage];
  }

  @override
  void initState() {
    super.initState();

    buttonTexts = {
      0: 'Cancel',
      (pages.length - 1): 'Save as Draft',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppIcons.starFilled),
                      SvgPicture.asset(AppIcons.notificationBell),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    getPageText(),
                    style: AppTextStyle.kDisplayTitleM,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: pages.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (_, index) => pages[index]),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: _currentPage == 0
                ? Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomOutLineButton(
                          text: 'Cancel',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          flex: 1,
                          child: SolidButton(
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              text: 'Save'))
                    ],
                  )
                : SolidButton(
                    onPressed: () async {
                      //TODO: Add event to server
                      final startTimeString = ref.read(eventProvider).startDate;
                      final endTimeString = ref.read(eventProvider).endDate;

                      DateTime? startTime = DateTime.tryParse(startTimeString);
                      DateTime? endTime = DateTime.tryParse(endTimeString);

                      if (startTime != null && endTime != null) {
                        final days = endTime.difference(startTime).inDays;
                        if (days < 0) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'End date cannot be before start date'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        ref.read(eventProvider.notifier).updateEventDays(days);
                        // Use 'days' as needed
                      } else {
                        // Handle invalid date formats
                        print(
                            "Invalid date format: startTime=$startTimeString, endTime=$endTimeString");
                      }

                      print(ref.read(eventProvider).toJson());

                      final respose = await ApiService()
                          .createEvent(ref.read(eventProvider).toJson(), token);
                      print(respose);

                      if (respose['success']) {
                        ref.read(eventProvider.notifier).removeEvent();
                        ref.invalidate(eventListProvider);
                        Navigator.pop(context);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(respose['message']),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                      }
                    },
                    text: 'Save',
                  ),
          ),
        );
      },
    );
  }
}
