import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reminder_app/Home/ErrorResponse.dart';
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


  getPermissionList(String type){
    ApiRepository().getPermissionList()
        .listen((response){
      var test = response as Response;
      Fluttertoast.showToast(msg: type+"++++++++received response" + test.data.toString());
      }, onError: (error){
      Fluttertoast.showToast(msg: (error as ErrorResponse).errorMessage);
    });
  }

  /*Future<LoginResponse> performLogin(String userName, String password) {
    return ApiRepository(). performLogin(LoginRequest(userName: userName, password: password));
  }*/
}