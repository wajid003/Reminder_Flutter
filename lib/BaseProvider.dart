import 'package:flutter/material.dart';

abstract class BaseProvider {
  static BuildContext _context;
  static bool _isProgressDialogShown;

  void performUnauthorize() {
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("UnAuthorize"),
          content: new Text("Please Re-login to authorize"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                dismissProgressbar();
              },
            ),
          ],
        );
      },
    );
  }

  BaseProvider(BuildContext context) {
    _context = context;
  }

  void showProgressbar() {
    _isProgressDialogShown = true;
    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 120.0, right: 120.0),
          child: Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                  color: Colors.transparent,
                  height: 90.0,
                  width: 10.0,
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      strokeWidth: 5.0))),
        );
      },
    );
  }

  void dismissProgressbar() {
    if(_isProgressDialogShown) {
      Navigator.pop(_context);
      _isProgressDialogShown = false;
    } //pop dialog
  }
}
