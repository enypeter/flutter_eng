import 'package:flutter/material.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/core/validator.dart';
import 'package:flutter_engr/views/screens/authentication/on_screen_keypad.dart';
import 'package:flutter_engr/views/widgets/button.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/controllers/controller.dart';
import 'package:flutter_engr/views/widgets/text_input_field.dart';
import 'package:get/get.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  List<String> currentPin = ["", "", "", ""];
  String pinOne = '', pinTwo = '', pinThree = '', pinFour = '';
  int pinIndex = 0;
  final _formKey = GlobalKey<FormState>();
  final Controller _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: BODY_PADDING),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _authController.sendOtp(false);
                      },
                      child: const CustomBackButton(),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Phone Verification',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  smallerVerticalSpace(),
                  _authController.sendOtp.isTrue
                      ? RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            const TextSpan(
                                text: 'Please type the verification code sent',
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w300)),
                            const TextSpan(
                                text: '\nto ',
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w300)),
                            TextSpan(
                                text:
                                    '(${_authController.intCode.value})${_authController.phoneNumberController.text.substring(0, 4)}****${_authController.phoneNumberController.text.substring(7, 8)}',
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500)),
                          ]))
                      : const Text(
                          'We will need to register your mobile\nnumber before getting started',
                          textAlign: TextAlign.center,
                        ),
                ],
              ),
              verticalSpace(0.05),
              _authController.sendOtp.isTrue
                  ? verificationScreen(_authController)
                  : phoneNumberVerification(_authController),
            ],
          ),
        ),
      ),
    );
  }

  Padding phoneNumberVerification(Controller _authController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BODY_PADDING),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextInputForm(
                hint: 'Phone Number',
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/NG.png',
                          height: 20,
                          width: 30,
                          fit: BoxFit.fitHeight,
                        ),
                        tinyHorizontalSpace(),
                        const Text('+234'),
                        tinyHorizontalSpace(),
                        Container(height: 20, color: AppColor.grey1, width: 1),
                        tinyHorizontalSpace()
                      ],
                    )),
                keyboardType: TextInputType.phone,
                controller: _authController.phoneNumberController,
                maxLength: 10,
                validator: (value) =>
                    PhoneNumberValidator.validatePhoneNumber(value),
                onChanged: (v) {
                  // if (active) _formKey.currentState!.validate();
                },
              ),
              verticalSpace(0.5),
              DefaultButton(
                  title: 'Send Code',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _authController.register();
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  verificationScreen(Controller _authController) {
    return Expanded(
      child: Column(
        children: [
          smallVerticalSpace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PinNumber(text: pinOne),
                PinNumber(text: pinTwo),
                PinNumber(text: pinThree),
                PinNumber(text: pinFour),
              ],
            ),
          ),
          smallVerticalSpace(),
          _authController.start.value != 0
              ? Center(
                  child: Obx(
                    () => Text(
                      '0:${_authController.start.value} sec',
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    _authController.sendOtp(false);
                    _authController.start(60);
                  },
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t receive any code?',
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
          smallVerticalSpace(),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
        child: Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KeyboardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    },
                  ),
                  KeyboardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    },
                  ),
                  KeyboardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    },
                  ),
                ],
              ),
            ),
            tinyVerticalSpace(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KeyboardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    },
                  ),
                  KeyboardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    },
                  ),
                  KeyboardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    },
                  ),
                ],
              ),
            ),
            tinyVerticalSpace(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KeyboardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    },
                  ),
                  KeyboardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    },
                  ),
                  KeyboardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    },
                  ),
                ],
              ),
            ),
            tinyVerticalSpace(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  KeyboardNumber(
                      n: 0,
                      onPressed: () {
                        pinIndexSetup("9");
                      }),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: InkWell(
                        onTap: clearPin,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Icon(
                              Icons.backspace_outlined,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 5) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) {
      print(strPin);
      _authController.validateOtp();
    }
  }

  setPin(int n, String text) {
    setState(() {});
    switch (n) {
      case 1:
        pinOne = text;
        break;
      case 2:
        pinTwo = text;
        break;

      case 3:
        pinThree = text;
        break;

      case 4:
        pinFour = text;
        break;
    }
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }
}

