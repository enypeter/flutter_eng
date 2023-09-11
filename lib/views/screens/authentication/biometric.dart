import 'package:flutter/material.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/widgets/button.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/views/screens/home/bottom_nav.dart';
import 'package:flutter_engr/views/widgets/on_boarding_header.dart';
import 'package:get/get.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({Key? key}) : super(key: key);

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
                          title: 'Last step!',
                          subtitle:
                              'Enable biometric for ease and smooth security'),
                      verticalSpace(0.1),
                      ClipOval(
                        child: Container(
                              height: height() * 0.3,
                              width: width() * 0.45,
                              decoration: BoxDecoration(
                                color: AppColor.lightGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                          child: const Icon(Icons.fingerprint_outlined,
                              color: AppColor.primaryColor, size: 150),
                        ),
                      ),
                      verticalSpace(0.2),
                      DefaultButton(
                          title: 'Go Home',
                          onTap: () => Get.offAll(() => const BottomNavMenu())),
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
