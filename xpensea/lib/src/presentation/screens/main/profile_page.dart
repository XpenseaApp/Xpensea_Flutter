import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/presentation/components/cards/setting_card.dart';
import 'package:xpensea/src/presentation/components/dialogs/report_problem_dialog.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 28,
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: AppTextStyle.kLargeBodyB,
                ),
                Text(
                  'Employee ID :$employeeID',
                  style:
                      AppTextStyle.kMediumBodyM.copyWith(color: Colors.black),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        const Divider(),
        // const SizedBox(
        //   height: 14,
        // ),
        // WalletCard(advanceAmount: 50000, amountUsed: 12350),
        const SizedBox(
          height: 28,
        ),
        SettingCard(
          settingParams: SettingParams(
            leadingImagePath: AppIcons.lock,
            title: 'Change MPIN',
            onTap: () {
              Navigator.pushNamed(context, '/changeMpin');
            },
          ),
        ),
        SettingCard(
          settingParams: SettingParams(
            leadingImagePath: AppIcons.warning,
            title: 'Report a problem',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const ReportProblemDialog(),
              );
            },
          ),
        ),

        SettingCard(
          settingParams: SettingParams(
            leadingImagePath: AppIcons.lock,
            title: 'Wallet',
            onTap: () {
              Navigator.pushNamed(context, '/wallet');
            },
          ),
        ),

        SettingCard(
          settingParams: SettingParams(
            leadingImagePath: AppIcons.warning,
            title: 'Policy',
            onTap: () {
              Navigator.pushNamed(context, '/policy');
            },
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('number');
            LoggedIn = false;
            Navigator.pushNamed(context, '/otp');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.logout),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Logout',
                style: AppTextStyle.kLargeBodySB.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
      ],
    );
  }
}
