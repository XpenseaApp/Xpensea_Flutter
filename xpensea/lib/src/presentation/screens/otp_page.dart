import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/core/theme/text_style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final PageController _pageController = PageController(initialPage: 0);
  onKeyboardTap(String value) {
    setState(() {
      controller.text = controller.text + value;
    });
  }

  final TextEditingController controller = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final FocusNode focusNode = FocusNode();

  static const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
  static const fillColor = Color.fromRGBO(243, 246, 249, 0);
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: borderColor),
    ),
  );
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _phoneInputPage(),
                _otpInputPage(),
                _createMPinPage(),
                _mPinInputPage(),
              ],
            )),
      ),
    );
  }

  Widget _phoneInputPage() {
    return Column(
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
          maxLength: 10,
          keyboardType: TextInputType.none,
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
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
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
        SolidButton(
          text: 'GENERATE OTP',
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        )
      ],
    );
  }

  Widget _otpInputPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Enter your OTP",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
          // Specify direction if desired
          textDirection: TextDirection.ltr,
          child: Pinput(
            // You can pass your own SmsRetriever implementation based on any package
            // in this example we are using the SmartAuth
            // smsRetriever: smsRetriever,
            controller: pinController,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            keyboardType: TextInputType.none,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              return value == '2222' ? null : 'Pin is incorrect';
            },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Resend OTP in 4:23",
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
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
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
        SolidButton(
          text: 'Next',
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        )
      ],
    );
  }

  Widget _createMPinPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Create your mPin",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
          // Specify direction if desired
          textDirection: TextDirection.ltr,
          child: Pinput(
            // You can pass your own SmsRetriever implementation based on any package
            // in this example we are using the SmartAuth
            // smsRetriever: smsRetriever,
            controller: pinController,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              return value == '2222' ? null : 'Pin is incorrect';
            },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
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
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
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
        SolidButton(
          text: 'Next',
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        )
      ],
    );
  }

  Widget _mPinInputPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Enter your mPin",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
          // Specify direction if desired
          textDirection: TextDirection.ltr,
          child: Pinput(
            // You can pass your own SmsRetriever implementation based on any package
            // in this example we are using the SmartAuth
            // smsRetriever: smsRetriever,
            controller: pinController,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              return value == '2222' ? null : 'Pin is incorrect';
            },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
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
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
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
        SolidButton(
          text: 'Login',
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        )
      ],
    );
  }
}
