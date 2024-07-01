import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/user_routes.dart' as userRoutes;
import 'package:xpensea/src/presentation/components/buttons/outline_button.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/report/basic_detail_page.dart';
import 'package:xpensea/src/presentation/screens/report/expenses_list_page.dart';
import 'package:xpensea/src/presentation/screens/report/preview_report.dart';

import 'success_report_page.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> pages = [
    const BasicDetailPage(),
    const ExpensesListPage(),
    const PreviewReport(),
    const SuccessReportPage(),
  ];

  final List<String> pageTitles = ['Basic Details', 'Expenses', 'Preview'];

  Map<int, String> buttonTexts = {};

  String getButtonText() {
    return buttonTexts.containsKey(_currentPage)
        ? buttonTexts[_currentPage]!
        : 'Back';
  }

  @override
  void initState() {
    super.initState();

    buttonTexts = {
      0: 'Home',
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
                  const Text(
                    'Create\nExpense Report',
                    style: AppTextStyle.kDisplayTitleM,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (_currentPage < pageTitles.length)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          (pages.length - 1), (index) => buildIndicator(index)),
                    ),
                  const SizedBox(
                    height: 20,
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
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomOutLineButton(
                    text: getButtonText(),
                    onPressed: () {
                      if (_currentPage == 0) {
                        ref.read(expensesProvider.notifier).removeAllExpense();
                        ref.read(reportProvider.notifier).removeReport();
                        Navigator.pop(context);
                      } else {
                        if (_currentPage < (pages.length - 1)) {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        } else {
                          //TODO: Save as Draft

                          ref
                              .read(expensesProvider.notifier)
                              .removeAllExpense();
                          ref.read(reportProvider.notifier).removeReport();

                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    flex: 1,
                    child: SolidButton(
                        onPressed: () async {
                          if (_currentPage < (pages.length - 1)) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          } else {
                            //TODO: add location functionality
                            ref
                                .read(reportProvider.notifier)
                                .updateReportLocation('Test Location');
                            ref
                                .read(reportProvider.notifier)
                                .updateReportType('other');
                            ref
                                .read(reportProvider.notifier)
                                .updateReportStatus('pending');
                            // ref
                            //     .read(reportProvider.notifier)
                            //     .updateReportEvent('6673f805cb67f6f4d2ef4b34');
                            final Report report = ref.read(reportProvider);
                            print(report.toJson());
                            final respose = await userRoutes.ApiService()
                                .createReport(report.toJson(), token);
                            print(respose.toString());
                            Navigator.pop(context);
                          }
                        },
                        text: _currentPage < (pages.length - 1)
                            ? 'Next'
                            : 'Submit'))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildIndicator(int index) {
    bool isPastOrCurrent = index <= _currentPage;
    EdgeInsets margin =
        index == 0 ? EdgeInsets.zero : const EdgeInsets.only(left: 24);
    return Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isPastOrCurrent ? const CustomBarWithCircle() : const CustomBar(),
            const SizedBox(
              height: 2,
            ),
            Text(
              pageTitles[index],
              style: AppTextStyle.kSmallBodySB.copyWith(
                  fontSize: 13,
                  color: isPastOrCurrent ? Colors.black : Colors.grey),
            )
          ],
        ));
  }
}

class CustomBarWithCircle extends StatelessWidget {
  const CustomBarWithCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: 100,
          height: 8,
          decoration: BoxDecoration(
            color: AppPalette.kPrimaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Positioned(
          right: -15,
          top: -7,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppPalette.kPrimaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBar extends StatelessWidget {
  const CustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
