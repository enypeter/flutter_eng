import 'package:flutter_engr/core/const.dart';


class EmailValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return emptyEmailField;
    }
    // Regex for email validation
    final regExp = RegExp(emailRegex);
    if (regExp.hasMatch(value) || value.contains(' ')) {
      return null;
    }
    return invalidEmailField;
  }
}

class FullNameValidator {
  static String? validateFullName(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }
    // Regex for name validation
    final regExp = RegExp(fullNameRegex);
    if (regExp.hasMatch(value) || value.contains(' ')) {
      return null;
    }
    return invalidFullName;
  }
}

class PhoneNumberValidator {
  static String? validatePhoneNumber(String value) {
    print(value);
    if (value.isEmpty) {
      return emptyTextField;
    }
    if (value.length < 10) {
      return PHONE_NUMBER_LENGTH_ERROR;
    }
    return null;
    // Regex for phone number validation
    // final regExp = RegExp(PHONE_NUMBER_REGEX);
    // print(regExp.hasMatch(value));
    // if (regExp.hasMatch(value)) {
    //   return null;
    // }
    // return INVALID_PHONE_NUMBER_FIELD;
  }
}

class PasswordValidator {
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return emptyPasswordField;
    }

    if (value.length < 8) {
      return passwordLengthError;
    }
    final regExp = RegExp(digitRegex);

    if (!regExp.hasMatch(value)) {
      return invalidPassword;
    }

    return null;
  }
}

class UsernameValidator {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return emptyUsernameField;
    }

    if (value.length < 6) {
      return usernameLengthError;
    }

    return null;
  }
}

class FieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}
