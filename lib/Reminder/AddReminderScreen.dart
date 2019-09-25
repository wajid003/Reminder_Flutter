
import 'package:flutter/material.dart';

class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Username'
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
