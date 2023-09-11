import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:get/get.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.onTap, required this.title});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}


InkWell closeButton() {
  return InkWell(
    onTap: () =>Get.back(),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          width: width() * 0.13,
          height: 2.5,
          decoration: BoxDecoration(
              color: AppColor.lightGrey, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.back(),
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0.5, 1),
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: AppColor.grey.withOpacity(0.3))
                ]),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.chevron_left),
            )));
  }
}
