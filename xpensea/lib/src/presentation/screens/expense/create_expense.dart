import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/buttons/outline_button.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/expense/basic_Expense_detail_page.dart';

class CreateExpense extends StatefulWidget {
  const CreateExpense({super.key});

  @override
  State<CreateExpense> createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> pages = [
    const BasicExpenseDetailPage(),
  ];

  final List<String> pageTitles = ['Create\nExpense Draft'];

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
                          text: 'Next'))
                ],
              )
            : SolidButton(
                onPressed: () {
                  //TODO: Add expense to server
                },
                text: 'Add Expense'),
      ),
    );
  }
}
