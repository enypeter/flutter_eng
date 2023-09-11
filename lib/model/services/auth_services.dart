import 'package:flutter_engr/model/services/api_scheme.dart';

class AuthenticationService {
  static login(email, password) async {
    return await ApiScheme.initialisePostRequest(
        url: 'loginUrl', data: {'password': password, 'email': email});
  }

  static register({email, firstName, lastName, phone, password}) async {
    var data ={
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phone,
      "password": password,
    };
    return await ApiScheme.initialisePostRequest(url: 'registerUrl', data: data);
  }

  static resendOtp(email) async {
    var data ={
      "email": email,
    };
    return await ApiScheme.initialisePostRequest(url: 'resendOtpUrl', data: data);
  }

  static verifyOtp(userId,code) async {
    var data ={
      "userId": userId,
      "code": code,
    };
    return await ApiScheme.initialisePostRequest(url: 'verifyOtpUrl', data: data);
  }

  static forgotPassword(email) async {
    var data ={
      "email": email,
    };
    return await ApiScheme.initialisePostRequest(url: 'forgotPasswordUrl', data: data);
  }


  static resetPassword({password,confirmPassword,userId}) async {
    var data ={
      "password": password,
      "confirmPassword": confirmPassword,
      "userId": userId
    };
    return await ApiScheme.initialisePostRequest(url: 'resetPasswordUrl', data: data);
  }


}

