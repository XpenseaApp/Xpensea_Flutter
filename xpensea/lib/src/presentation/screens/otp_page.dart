import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  onKeyboardTap(String value) {
    setState(() {
      controller.text = controller.text + value;
    });
  }

  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.starFilled),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your Phone number",
                style: AppTextStyle.kDisplayTitleM,
              ),
              const SizedBox(
                height: 20,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useBottomSheetSafeArea: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "We will send you the 4 digit Verification code",
                style: AppTextStyle.kSmallTitleR,
              ),
              const Spacer(),
              NumericKeyboard(
                  onKeyboardTap: onKeyboardTap,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                  rightButtonFn: () {
                    if (controller.text.isEmpty) return;
                    setState(() {
                      controller.text = controller.text
                          .substring(0, controller.text.length - 1);
                    });
                  },
                  rightButtonLongPressFn: () {
                    if (controller.text.isEmpty) return;
                    setState(() {
                      controller.text = '';
                    });
                  },
                  rightIcon: const Icon(
                    Icons.backspace_outlined,
                    color: Colors.blueGrey,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              const SizedBox(
                height: 20,
              ),
              const SolidButton()
            ],
          ),
        ),
      ),
    );
  }
}
