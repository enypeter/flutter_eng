import 'package:flutter/material.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/widgets/button.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/views/widgets/text_input_field.dart';
import 'package:flutter_engr/views/screens/home/bottom_nav.dart';
import 'package:flutter_engr/views/screens/authentication/register.dart';
import 'package:flutter_engr/views/widgets/dialogs.dart';
import 'package:flutter_engr/views/widgets/on_boarding_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            padding: const EdgeInsets.all(BODY_PADDING),
            margin: EdgeInsets.only(top: height() * 0.05),
            child: ListView(
              children: [
                verticalSpace(0.03),
                const OnboardingHeader(
                    title: 'Welcome!',
                    subtitle: 'Sign in to gain access to a life of unlimited'),
                verticalSpace(0.05),
                const TextInputForm(
                  label: 'Phone Number',
                  hint: '080xxxxxxxx',
                ),
                const TextInputForm(
                  label: 'Password',
                  hint: '*********',
                  obscure: true,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: AppColor.primaryColor),
                    )),
                verticalSpace(0.1),
                InkWell(
                  onTap: () {
                    Dialogs.noticeDialog(
                        title: 'Biometric',
                        icon: SvgPicture.asset(
                          'assets/icons/biometric.svg',
                          color: AppColor.primaryColor,
                          height: 50,
                        ),
                        message: 'Enable login using biometric access',
                        cancelText: 'Cancel',
                        actionText: 'Confirm',
                        cancel: () {
                          Get.back();
                        },
                        action: () {
                          Get.back();
                        });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/biometric.svg',
                    color: AppColor.primaryColor,
                    height: 50,
                  ),
                ),
                verticalSpace(0.1),
                DefaultButton(
                  title: 'Sign in',
                  onTap: () => Get.offAll(() => const BottomNavMenu()),
                ),
                smallVerticalSpace(),
                InkWell(
                  radius: 3,
                  onTap: () => Get.to(() =>  RegisterScreen()),
                  child: const Text(
                    "Don't have an account? Sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColor.primaryColor),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
