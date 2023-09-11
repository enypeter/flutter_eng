import 'package:flutter/material.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/core/validator.dart';
import 'package:flutter_engr/views/widgets/button.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/controllers/controller.dart';
import 'package:flutter_engr/views/widgets/text_input_field.dart';
import 'package:flutter_engr/views/screens/authentication/verify.dart';
import 'package:flutter_engr/views/widgets/on_boarding_header.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();
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
            child: Obx(
              () => Form(
                key: _formKey,
                child: Column(
                  children: [
                    const OnboardingHeader(
                      title: 'Create Account',
                      subtitle:
                          'Sign up and create access to a life of unlimited',
                    ),
                    smallVerticalSpace(),
                    TextInputForm(
                      label: 'First Name',
                      hint: 'Paul',
                      controller: controller.firstNameController,
                      validator: (value) => FieldValidator.validate(value),
                    ),
                    TextInputForm(
                      label: 'Last Name',
                      hint: 'Jack',
                      validator: (value) => FieldValidator.validate(value),
                      controller: controller.lastNameController,
                    ),
                    TextInputForm(
                      label: 'Email Address',
                      hint: 'abc@google.com',
                      controller: controller.emailController,
                      validator: (value) => EmailValidator.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextInputForm(
                      label: 'Password',
                      hint: '*********',
                      obscure: controller.isObsc.isTrue,
                      validator: (value) =>
                          PasswordValidator.validatePassword(value),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isObsc.value = !controller.isObsc.isTrue;
                        },
                        icon: Icon(
                          controller.isObsc.isTrue
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                    verticalSpace(0.1),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style:
                            TextStyle(fontSize: 12, color: AppColor.textColor),
                        children: [
                          TextSpan(
                            text: "By signing up, you agree with the\n",
                          ),
                          TextSpan(
                            text: "term and conditions",
                            style: TextStyle(color: AppColor.primaryColor),
                          ),
                          TextSpan(
                            text: " and the ",
                          ),
                          TextSpan(
                            text: "privacy policy",
                            style: TextStyle(color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(0.1),
                    DefaultButton(
                        title: 'Sign up',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(() => const VerifyOTPScreen());
                          }
                        }),
                    smallVerticalSpace(),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Text(
                        "Already have an account? Sign in",
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
        ));
  }
}
