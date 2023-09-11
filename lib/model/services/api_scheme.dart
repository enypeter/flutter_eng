import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class ApiScheme {
  static makePostRequest({apiUrl, data, token}) async {
    print(apiUrl);
    print('auth - $token');

    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (token == null) {
      print('no auth');

      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        "Authorization": "Bearer $token"
      };
    }
    return await http.post(uri, body: jsonString, headers: headers);
  }

  static makePatchRequest({apiUrl, data, token}) async {
    print(apiUrl);
    print('auth - $token');

    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (token == null) {
      print('no auth');

      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        "Authorization": "Bearer $token"
      };
    }
    return await http.patch(uri, body: jsonString, headers: headers);
  }


  static makeGetRequest({apiUrl, token}) async {
    print(apiUrl);
    var uri = Uri.parse(apiUrl);
    var headers;
    if (token == null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        "Authorization": "Bearer $token"
      };
    }
    return await http.get(uri, headers: headers);
  }

  static initialisePostRequest(
      {required data, required String url, token}) async {
    try {
      print(data);

      http.Response response = await makePostRequest(
          apiUrl: url, data: data, token: token);
      print(response.body);
      print(response.statusCode);
      var body = jsonDecode(response.body);

      if (isRequestSuccessful(response.statusCode)) {
        print('Success');
        return body;
      } else {
        return handleError(response);
      }
    }
    catch (e) {
      if (e.toString().contains('HandshakeException')||e.toString().contains('Socket')) {
        return 'Check your internet connection';
      } else {
        return e.toString();
      }
    }
  }

  static initialiseGetRequest({required String url, token}) async {
    // if (await InternetServices.checkConnectivity()) {
    try {
      http.Response response =
      await makeGetRequest(apiUrl: url, token: token);

      print(response.request!.headers);
      var body = jsonDecode(response.body);

      if (isRequestSuccessful(response.statusCode)) {
        return body;
      } else {
        return handleError(response);
      }
    }     catch (e) {
      if (e.toString().contains('HandshakeException')||e.toString().contains('Socket')) {
        return 'Check your internet connection';
      } else {
        return e.toString();
      }
    }
    // } else {
    //   return 'Check your internet connection';
    // }
  }

  static initialisePatchRequest({required String url, token}) async {
    // if (await InternetServices.checkConnectivity()) {
    try {
      http.Response response =
      await makePatchRequest(apiUrl: url, token: token);

      print(response.request!.headers);
      var body = jsonDecode(response.body);

      if (isRequestSuccessful(response.statusCode)) {
        return body;
      } else {
        return handleError(response);
      }
    }     catch (e) {
      if (e.toString().contains('HandshakeException')||e.toString().contains('Socket')) {
        return 'Check your internet connection';
      } else {
        return e.toString();
      }
    }
    // } else {
    //   return 'Check your internet connection';
    // }
  }

  static handleError(http.Response response) {
    var msg =jsonDecode(response.body)['message'] ;
    switch (response.statusCode) {
      case 400:
        throw msg;

      case 401:
        throw 'Unauthorized request-$msg';

      case 403:
        throw 'Forbidden Error-$msg';
      case 404:
        throw 'Not Found - $msg';

      case 422:
        throw 'Unable to process - $msg';

      case 500:
        throw 'Server error - $msg';
      default:
        throw 'Error occurred with code : $response';
    }
  }

  static isRequestSuccessful(int? statusCode) {
    return statusCode! >= 200 && statusCode < 300;
  }
}
