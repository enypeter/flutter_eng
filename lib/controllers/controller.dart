import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_engr/views/screens/authentication/create_pin.dart';
import 'package:flutter_engr/views/screens/authentication/login.dart';
import 'package:flutter_engr/model/services/auth_services.dart';
import 'package:flutter_engr/views/screens/home/bottom_nav.dart';
import 'package:flutter_engr/views/widgets/dialogs.dart';
import 'package:flutter_engr/views/widgets/snackbar.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  RxBool isObsc = true.obs;
 TextEditingController firstNameController= TextEditingController();
 TextEditingController lastNameController= TextEditingController();
 TextEditingController emailController= TextEditingController();
 TextEditingController phoneNumberController= TextEditingController();
 TextEditingController passwordController= TextEditingController();
  late Timer _timer;
  RxInt start = 60.obs;
  RxBool sendOtp = false.obs;
  RxString intCode = '+234'.obs;
  RxString userId = ''.obs;
  RxInt otpCode = 0.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const LoginScreen());
    });
    super.onReady();
  }

  changePassVisibility() => isObsc.value = !isObsc.value;

  setIntCode(value) => intCode.value = value;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }

  signIn() async {
    Dialogs.showLoading();
    var response = await AuthenticationService.login(
        emailController.text, passwordController.text);
    print(response);
    Get.back();

    if (response is String) {
      CustomSnack.showErrorSnackBar('Oops! Failed', response);
    } else {
      // _localStorage.storeData('password', passwordController.text);
      // _localStorage.storeData('email', emailController.text);

      // UserController _userController = Get.put(UserController());
      // _userController.setUserDetails(response['data'], true);
    }
  }

  validateOtp() async {
    Dialogs.showLoading();
    _timer.cancel();
    var response =
    await AuthenticationService.verifyOtp(userId.value, otpCode.value);
    print(response);
    Get.back();

    if (response is String) {
      Get.offAll(() => CreatePin());

      CustomSnack.showSuccessSnackBar('Congratulation', 'Welcome, registration successful');
    } else {
      Get.offAll(() => CreatePin());

    }
  }

  register() async {
    Dialogs.showLoading();
    var response = await AuthenticationService.register(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: '${intCode.value}${phoneNumberController.text}');
    print(response);
    Get.back();

    if (response is String) {
      sendOtp(true);
      startTimer();
      CustomSnack.showSuccessSnackBar('Cool!', "OTP sent to your mobile device");
    } else {
      var id = response['_id'];
      userId(id);
      sendOtp(true);
      startTimer();

    }
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    isObsc(false);
    super.dispose();
  }
}