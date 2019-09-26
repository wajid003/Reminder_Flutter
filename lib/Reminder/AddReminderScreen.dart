
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
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                        hintText: "Title"
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: "Date"
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0)
              ),
              height: 100.0,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Description",
                    border: InputBorder.none
                  ),
                ),
              ),
            SizedBox(
              height: 16.0,
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 40.0,
              buttonColor: Colors.black,
              child: RaisedButton(
                onPressed: ()=>{

              },
              child: Text("Submit"),textColor: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
