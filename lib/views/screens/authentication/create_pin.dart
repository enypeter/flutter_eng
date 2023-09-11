import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/screens/authentication/biometric.dart';
import 'package:flutter_engr/views/widgets/button.dart';
import 'package:flutter_engr/views/widgets/on_boarding_header.dart';
import 'package:flutter_engr/views/widgets/pin_field.dart';
import 'package:get/get.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomBackButton(),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                padding: const EdgeInsets.all(BODY_PADDING),
                margin: EdgeInsets.only(top: height() * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const OnboardingHeader(
                          title: 'Almost there!',
                          subtitle:
                              'Create a security pin for your transactions'),
                      smallVerticalSpace(),
                      PinField(
                        label: 'PIN',
                        length: 4,
                        onChanged: (value) {},
                        onCompleted: (value) {},
                        validator: (value) {
                          return null;
                        },
                      ),
                      verticalSpace(0.35),
                      DefaultButton(
                          title: 'Create PIN',
                          onTap: () => Get.to(() => const BiometricScreen())),
                      smallerVerticalSpace(),
                      InkWell(
                        onTap: () => Get.back(),
                        child: const Text(
                          "Enable biometric/Face ID",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
