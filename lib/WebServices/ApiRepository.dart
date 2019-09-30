
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:reminder_app/Login/LoginRequest.dart';
import 'package:reminder_app/Login/LoginResponse.dart';
import 'package:reminder_app/WebServices/ApiClient.dart';
import 'package:reminder_app/WebServices/ApiEndPoint.dart';

class ApiRepository {
  static final ApiRepository _apiClient = ApiRepository._internal();
  static final Dio _dio = ApiClient().getDio();
  ApiRepository._internal();

  factory ApiRepository() {
    return _apiClient;
  }

 Future<LoginResponse> performLogin(LoginRequest loginRequest) {
      _dio.post(ApiEndPoint.login, data: jsonEncode(loginRequest))
    .then((response) {
       return LoginResponse.fromJson(response.data);
    });
  }
}