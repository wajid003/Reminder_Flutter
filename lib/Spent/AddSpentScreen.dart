import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddSpentScreen extends StatefulWidget {
  @override
  _AddSpentScreenState createState() => _AddSpentScreenState();
}

class _AddSpentScreenState extends State<AddSpentScreen> {
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
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
                      controller: _dateController,
                      onTap: () {
                        _showDatePicker();
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
                          ),
                          hintText: "Reason"
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,
                                width: 2.0),
                          ),
                          hintText: "Amount"
                      ),
                    ),
                  )
                ],
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
                onPressed: () =>
                {
                },
                child: Text("Submit"), textColor: Colors.white,),
            )
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        onChanged: (date) {
//          print('change $date');
        },
        onConfirm: (date) {
          _dateController.text = date.year.toString()+"-"+date.month.toString()+"-"+date.day.toString()+" "+date.hour.toString()+
              ":"+date.minute.toString();
          print('confirm $date');
        },
        currentTime: DateTime.now(),
        locale: LocaleType.en);
  }

}
