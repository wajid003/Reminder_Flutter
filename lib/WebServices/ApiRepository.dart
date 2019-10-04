import 'dart:async';

import 'package:dio/dio.dart';
import 'package:reminder_app/BaseResponse.dart';
import 'package:reminder_app/Home/ErrorResponse.dart';
import 'package:reminder_app/Login/LoginProvider.dart';
import 'package:reminder_app/WebServices/ApiClient.dart';
import 'package:reminder_app/WebServices/ApiEndPoint.dart';

import '../BaseProvider.dart';

class ApiRepository {
  static final ApiRepository _apiClient = ApiRepository._internal();
  static final Dio _dio = ApiClient().getDio();
  static StreamController _streamController = StreamController.broadcast();
  static BaseProvider _baseProvider;

  ApiRepository._internal();

  factory ApiRepository(BaseProvider baseProvider) {
    _baseProvider = baseProvider;
    return _apiClient;
  }

  void _enqueue(Response response) {
    if (response.data != null && response.statusCode == 200) {
      _streamController.sink.add(response);
    } else if (response.statusCode == 401) {
      /**Perform unauthorize operation**/
      _baseProvider.performUnauthorize();
    } else if (response.statusCode == 202) {
      _streamController.sink.addError(ErrorResponse(
          errorMessage: (response as BaseResponse).message,
          statusCode: response.statusCode));
    } else {
      _streamController.sink.addError(ErrorResponse(
          errorMessage: "Something went wrong",
          statusCode: response.statusCode));
    }
    _closeStream();
  }

  void _closeStream() {
    _streamController.close();
    _streamController = null;
  }

  Stream _getStreamController() {
    _streamController = StreamController();
    return _streamController.stream;
  }

  Stream<dynamic> _perFormApi(Future<Response> apiCall) {
    apiCall.then((response) {
      _enqueue(response);
    }, onError: (error) {
      _enqueue((error as DioError).response);
    });
    return _getStreamController();
  }

  Stream<dynamic> getPermissionList() {
    return _perFormApi(_dio.get(ApiEndPoint.permission));
  }
}
