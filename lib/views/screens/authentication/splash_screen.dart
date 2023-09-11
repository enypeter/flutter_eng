import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0D4E66),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            const Text(
              'Payble!',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF84D9D9)),
            ),
            Center(
              child: Image.asset(
                'assets/images/payble-mark.png',
                width: width() * 0.2,
              ),
            ),
            const Spacer(),
            const Text(
              'Version 0.1',
              style: TextStyle(
                  fontSize: 13,
                  color: AppColor.backgroundColor),
            ),
smallVerticalSpace(),
          ],
        ));
  }
}
