import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/Home/HomeScreen.dart';
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
    var loginState = Provider.of<LoginProvider>(context);
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
        RaisedButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
           /* if (_usernameController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty)
              loginState.perFormLogin(
                  _usernameController.text, _passwordController.text);
            else
              Fluttertoast.showToast(msg: "Enter All the details");*/
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          child: Text("SignUp"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
        )
      ],
    );
  }
}
