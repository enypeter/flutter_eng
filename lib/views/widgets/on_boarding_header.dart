import 'package:flutter/cupertino.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({Key? key, this.title, this.subtitle})
      : super(key: key);
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(title!,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColor)),
        vTinyHorizontalSpace(),
         Text(subtitle!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColor.textColor)),
      ],
    );
  }
}
