import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reminder_app/Login/LoginRequest.dart';
import 'package:reminder_app/Login/LoginResponse.dart';
import 'package:reminder_app/WebServices/ApiRepository.dart';

class LoginProvider extends ChangeNotifier {

  bool showProgressBar = false;
  BuildContext _context;

  getScreenContext(BuildContext context){
    _context = context;
    Fluttertoast.showToast(
      msg: "got context"
    );
  }

  perFormLogin(String userName, String password) async {
    var loginResponse = await performLogin(userName, password);

  }

  Future<LoginResponse> performLogin(String userName, String password) {
    return ApiRepository().performLogin(LoginRequest(userName: userName, password: password));
  }
}