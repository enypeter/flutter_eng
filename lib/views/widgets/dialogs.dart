import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:get/get.dart';

class Dialogs {
  static Future<bool?> noticeDialog(
      {String? title,
        String? message,
        String? actionText,
        String? cancelText,
        Widget? icon,
        void Function()? action,
        void Function()? cancel}) {
    return Get.bottomSheet(
      Container(
          height: height() * 0.38,
          padding: const EdgeInsets.all(BODY_PADDING),
          margin: const EdgeInsets.all(BODY_PADDING),
          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              smallerVerticalSpace(),

              Container(
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: icon??Image.asset('assets/icons/notification.svg',
                        color: AppColor.primaryColor, height: 40),
                  )),
              smallVerticalSpace(),
              Text(
                title ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              tinyVerticalSpace(),
              Text(message ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1.5)),
              verticalSpace(0.035),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: cancel ??
                                () {
                              Get.back();
                            },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primaryColor, width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                                child: Text(cancelText ?? '',
                                    style: const TextStyle(color: AppColor.primaryColor)
                                        .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15))),
                          ),
                        ),
                      )),
              smallHorizontalSpace(),
                  Expanded(
                      child: DialogButton(
                        actionText: actionText ?? 'Ok',
                        action: action,
                      )),
                ],
              )
            ],
          )),
      enableDrag: false,
      backgroundColor: Colors.transparent,
    );
  }

  static Future<void> showLoading( {text}) async {
    return Get.dialog(
      AlertDialog(
        elevation: 0,
        contentPadding: const EdgeInsets.all(20),
        backgroundColor: Colors.transparent,
        content: InkWell(
          onTap: () => Get.back(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const Center(
                    child: SizedBox(
                        height: 85,
                        width: 85,
                        child: CircularProgressIndicator(
                            backgroundColor: AppColor.secondaryColor,
                            strokeWidth: 3, color: Colors.white)),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          Image.asset(
                           'assets/images/payble-mark.png',
                            fit: BoxFit.fitHeight,
                            color: Colors.white,
                            width: 56,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              smallerVerticalSpace(),
              Text(
                text ?? 'Loading... Please wait.',
                style: const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({Key? key, required this.action, required this.actionText})
      : super(key: key);
  final action;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.primaryColor, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18,15,18,15),
          child: Center(
              child: Text(actionText ?? '',
                  style: const TextStyle
                    (color:AppColor.white,fontWeight: FontWeight.w600, fontSize: 15))),
        ),
      ),
    );
  }
}
