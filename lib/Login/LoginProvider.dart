import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reminder_app/Home/ErrorResponse.dart';
import 'package:reminder_app/WebServices/ApiRepository.dart';

import '../BaseProvider.dart';

class LoginProvider extends BaseProvider with ChangeNotifier {
  bool showProgressBar = false;
  bool changeTextColor = false;
  bool changeLoginColor = false;

  BuildContext _context;

  LoginProvider(BuildContext context) : super(context) {
    _context = context;
  }

  void alterText() {
    changeTextColor = !changeTextColor;
    notifyListeners();
  }

  void alterLoginText() {
    changeLoginColor = !changeLoginColor;
    notifyListeners();
  }

  getPermissionList(String type) {
    showProgressbar();
    ApiRepository(this).getPermissionList().listen((response) {
      dismissProgressbar();
      var test = response as Response;
      Fluttertoast.showToast(
          msg: type + "++++++++received response" + test.data.toString());
    }, onError: (error) {
      Fluttertoast.showToast(msg: (error as ErrorResponse).errorMessage);
    });
  }

/*Future<LoginResponse> performLogin(String userName, String password) {
    return ApiRepository(). performLogin(LoginRequest(userName: userName, password: password));
  }*/
}
