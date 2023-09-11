import 'package:flutter/material.dart';
import 'package:get/get.dart';

double width() => Get.width;

double height() => Get.height;

const double BODY_PADDING = 20.0;
smallHorizontal30Space() => const SizedBox(width: 30);
smallVerticalSpace() => const SizedBox(height: 30);
smallerVerticalSpace() => const SizedBox(height: 20);
smallHorizontalSpace() => const SizedBox(width: 20);
tinyVerticalSpace() => const SizedBox(height: 15);
tinyHorizontal15Space() => const SizedBox(width: 15);
tinyHorizontalSpace() => const SizedBox(width: 10);
vTinyHorizontalSpace() => const SizedBox(height: 10);
verticalSpace(double factor) => SizedBox(height:height()* factor);
horizontalSpace(double factor) => SizedBox(width:width()* factor);



const String emptyEmailField = 'Email field cannot be empty!';
const String emptyTextField = 'Field cannot be empty!';
const String emptyPasswordField = 'Password field cannot be empty';
const String invalidEmailField =
    "Email provided isn\'t valid.Try another email address";
const String invalidFullName =
    "Full name provided isn\'t valid. Add another name";
const String passwordLengthError = 'Password length must be greater than 8';
const String invalidPassword = 'Password must meet all requirements';
const String emptyUsernameField = 'Username  cannot be empty';
const String usernameLengthError = 'Username length must be greater than 6';
const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
    '\\@' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
    '(' +
    '\\.' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
    ')+';
const String fullNameRegex = r'^[a-z A-Z,.\-]+$';
const String passwordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const String upperCaseRegex = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{8,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{8,}$';
const String digitRegex = r'^(?=.*?[0-9]).{8,}$';

const String PHONE_NUMBER_REGEX = r'0[789][01]\d{8}';
const String PHONE_NUMBER_LENGTH_ERROR = 'Phone number must be 11 digits';
const String INVALID_PHONE_NUMBER_FIELD =
    "Number provided isn\'t valid.Try another phone number";



