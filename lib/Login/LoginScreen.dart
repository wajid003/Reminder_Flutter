import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/Home/HomeScreen.dart';
import 'package:reminder_app/Login/LoginResponse.dart';
import 'package:reminder_app/Signup/SignupScreen.dart';

import 'LoginProvider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginState = Provider.of<LoginProvider>(context, listen: false);
//    loginState.getScreenContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return "Enter UserName";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(labelText: "UserName"),
          controller: _usernameController,
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return "Enter Password";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(labelText: "Password"),
          controller: _passwordController,
        ),
        SizedBox(
          height: 20.0,
        ),
        Selector<LoginProvider, bool>(
          builder:(context, data, child){
            print('++++++++++++++++++++++++++++login button reloaded');
            return RaisedButton(
                child: Text("Login", style: TextStyle(color: data? Colors.green : Colors.black)),
              onPressed: () {

//                  loginState.alterLoginText();

                /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );*/

                loginState.getPermissionList("login");

                /*loginState.showSnackBar();
              if (_usernameController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty) {
                loginState.perFormLogin(
                    _usernameController.text, _passwordController.text);
              }*/
                /* else
                Fluttertoast.showToast(msg: "Enter All the details");*/
              },
            );
          }
          ,selector: (context, provider)=>provider.changeLoginColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        Selector<LoginProvider, bool>(
          builder: (context, data, child) {
            print('++++++++++++++++++++++++++++signup button reloaded');
            return RaisedButton(
              child: Text("SignUp", style: TextStyle(color: data ? Colors.green : Colors.black)),
              onPressed: () {
                loginState.alterText();
                /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangeNotifierProvider<LoginProvider>(
                    builder: (context) => LoginProvider(context),
                    child: SignupScreen())),
              );*/
              },
            );
          },
          selector: (context, changeText) => loginState.changeTextColor,
        )
      ],
    );
  }
}
