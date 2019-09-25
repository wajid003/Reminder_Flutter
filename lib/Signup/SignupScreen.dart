import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding : false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                "https://homepages.cae.wisc.edu/~ece533/images/cat.png"),
          ),
          SizedBox(
            height: 20.0,
          ),
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
            child: Text("SignUp"),
            onPressed: () {},
          )
        ],
      ),
    );
    ;
  }
}
