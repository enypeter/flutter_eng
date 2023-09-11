import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:pinput/pinput.dart';

class PinField extends StatelessWidget {
  const PinField(
      {Key? key,
        this.onChanged,
        this.onCompleted,
        this.validator,
        this.length = 6,
        this.label})
      : super(key: key);
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final int length;
  final String? label;

  Widget buildPinPut(context) {
    return Pinput(
        length: length,
        defaultPinTheme: pinTheme(context),
        focusedPinTheme: pinTheme(context),
        submittedPinTheme: pinTheme(context),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        validator: validator,
        errorTextStyle: const TextStyle(color: Colors.red),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: onCompleted,
        onChanged: onChanged);
  }

  PinTheme pinTheme(context) {
    return PinTheme(
      width: width()/(length),
      height: 50,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.lightGrey, width: 0.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 5),
        buildPinPut(context),
      ],
    );
  }
}
