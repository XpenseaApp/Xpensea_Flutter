import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/presentation/components/buttons/solid_button.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import '../routes/routes.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final Helper _helper = Helper();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController mpinController = TextEditingController();

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

  void onKeyboardTap(String value) {
    setState(() {
      phoneController.text = phoneController.text + value;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> CheckNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedNumber = prefs.getString('number');
    if (savedNumber != null && savedNumber.isNotEmpty) {
      phoneController.text = savedNumber;
      _pageController.jumpToPage(2);
    }
  }

  Future<void> sendOtp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('number', phoneController.text);
    final response = await _helper.sendOtp(phoneController.text);
    if (response['success']) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // handle error
      //TODO: remove after otp backend finished
      print(response['message']);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> verifyOtp() async {
    final response =
        await _helper.verifyUser(phoneController.text, otpController.text);
    if (response['success']) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // handle error
      print(response['message']);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> handleMpin() async {
    final response =
        await _helper.mpinHandler(phoneController.text, mpinController.text);
    if (!response['success']) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            final res = response['message'].toString();
            return CupertinoAlertDialog(
              title: const Text('Debug'),
              content: Text(res),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    if (response['success']) {
      print(response['data']);
      token = response['data']['data']['token'].toString();
      approver = response['data']['data']['userType'].toString() == 'approver'
          ? true
          : false;
      username = response['data']['data']['username'].toString();
      employeeID = response['data']['data']['employeeId'].toString();
      LoggedIn = true;
      Navigator.pushReplacementNamed(context, AppRoutes.mainpage);
      // Save response data in shared preferences
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('response_data', response['data']);
      // await prefs.setString('mobile', phoneController.text);
    } else {
      // handle error
      print(response['message']);
    }
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
          ),
        ),
      ),
    );
  }

  Widget _phoneInputPage() {
    CheckNumber();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(height: 10),
        const Text(
          "Enter your Phone number",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(height: 20),
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
          textFieldController: phoneController,
          formatInput: true,
          maxLength: 11,
          keyboardType: TextInputType.none,
          inputBorder: const OutlineInputBorder(),
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
        const SizedBox(height: 20),
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
            if (phoneController.text.isEmpty) return;
            setState(() {
              phoneController.text = phoneController.text
                  .substring(0, phoneController.text.length - 1);
            });
          },
          rightButtonLongPressFn: () {
            if (phoneController.text.isEmpty) return;
            setState(() {
              phoneController.text = '';
            });
          },
          rightIcon: const Icon(
            Icons.backspace_outlined,
            color: Colors.blueGrey,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        const SizedBox(height: 20),
        SolidButton(
          text: 'GENERATE OTP',
          onPressed: sendOtp,
        ),
      ],
    );
  }

  Widget _otpInputPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(height: 10),
        const Text(
          "Enter your OTP",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: otpController,
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
        const SizedBox(height: 20),
        const Text(
          "Resend OTP in 4:23",
          style: AppTextStyle.kSmallTitleR,
        ),
        const Spacer(),
        NumericKeyboard(
          onKeyboardTap: (value) {
            setState(() {
              otpController.text = otpController.text + value;
            });
          },
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
          rightButtonFn: () {
            if (otpController.text.isEmpty) return;
            setState(() {
              otpController.text = otpController.text
                  .substring(0, otpController.text.length - 1);
            });
          },
          rightButtonLongPressFn: () {
            if (otpController.text.isEmpty) return;
            setState(() {
              otpController.text = '';
            });
          },
          rightIcon: const Icon(
            Icons.backspace_outlined,
            color: Colors.blueGrey,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        const SizedBox(height: 20),
        SolidButton(
          text: 'Next',
          onPressed: verifyOtp,
        ),
      ],
    );
  }

  Widget _createMPinPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(height: 10),
        Text(
          LoggedIn ? "Create MPIN" : " MPIN",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: mpinController,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            keyboardType: TextInputType.none,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              return value != null && value.length == 4 ? null : 'Invalid MPIN';
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
        const SizedBox(height: 20),
        const Spacer(),
        NumericKeyboard(
          onKeyboardTap: (value) {
            setState(() {
              mpinController.text = mpinController.text + value;
            });
          },
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
          rightButtonFn: () {
            if (mpinController.text.isEmpty) return;
            setState(() {
              mpinController.text = mpinController.text
                  .substring(0, mpinController.text.length - 1);
            });
          },
          rightButtonLongPressFn: () {
            if (mpinController.text.isEmpty) return;
            setState(() {
              mpinController.text = '';
            });
          },
          rightIcon: const Icon(
            Icons.backspace_outlined,
            color: Colors.blueGrey,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        const SizedBox(height: 20),
        SolidButton(
          text: 'Next',
          onPressed: handleMpin,
        ),
      ],
    );
  }

  Widget _mPinInputPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.starFilled),
        const SizedBox(height: 10),
        const Text(
          "Enter MPIN",
          style: AppTextStyle.kDisplayTitleM,
        ),
        const SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: mpinController,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            keyboardType: TextInputType.none,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              return value != null && value.length == 4 ? null : 'Invalid MPIN';
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
        const SizedBox(height: 20),
        const Spacer(),
        NumericKeyboard(
          onKeyboardTap: (value) {
            setState(() {
              mpinController.text = mpinController.text + value;
            });
          },
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
          rightButtonFn: () {
            if (mpinController.text.isEmpty) return;
            setState(() {
              mpinController.text = mpinController.text
                  .substring(0, mpinController.text.length - 1);
            });
          },
          rightButtonLongPressFn: () {
            if (mpinController.text.isEmpty) return;
            setState(() {
              mpinController.text = '';
            });
          },
          rightIcon: const Icon(
            Icons.backspace_outlined,
            color: Colors.blueGrey,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        const SizedBox(height: 20),
        SolidButton(
          text: 'Next',
          onPressed: handleMpin,
        ),
      ],
    );
  }
}
