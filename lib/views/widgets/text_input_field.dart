import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engr/core/color.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.controller,
    this.label,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final onSubmit;
  final validator;
  final bool enabled;
  final TextEditingController? controller;
  final bool obscure;
  final String? label;
  final String? prefixText;
  final String? hint;
  final TextCapitalization textCapitalization;
  final keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: InkWell(
      onTap: onTap,
      child: TextFormField(
        buildCounter: (context,
            {required currentLength, required isFocused, maxLength}) =>
        null,
        inputFormatters: inputFormatters,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
            fontSize: 14,
            color: AppColor.textColor,
            fontWeight: FontWeight.w300),
        textCapitalization: textCapitalization,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        obscureText: obscure,
        obscuringCharacter: '*',
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          filled: false,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 0.3),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
              const BorderSide(color: Colors.redAccent, width: 0.1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
              const BorderSide(color: AppColor.grey, width: 0.3)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelText: label,
          hintText: hint,
          prefixText: prefixText,
          labelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AppColor.grey),
          hintStyle: const TextStyle(fontSize: 13, color: AppColor.grey),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    ),
  );
}
