
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AddReminderScreen.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
            backgroundColor: Colors.transparent,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddReminderScreen()),
              );
        },
        child: Icon(Icons.add_circle, color: Colors.blue, size: 40.0 )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _getHeader(),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                child: Text("Reminders", style: TextStyle(fontSize: 24.0)),
              ),
              SizedBox(height: 16.0),
              Expanded(child: _getList())
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage("https://homepages.cae.wisc.edu/~ece533/images/cat.png"),
          radius: 30.0,
        ),
        SizedBox(
          width: 12.0,
        ),
        Text("Welcom Abdul!", style: TextStyle(fontSize: 20.0),)
      ],
    );
  }

  Widget _getList() {
    return ListView.builder(
        itemBuilder: (context, position){
          return _getListItem(position);
        });
  }

  Widget _getListItem(int position) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgPicture.asset("assets/reminder.svg",
              width: 18.0,
              height: 18.0,),
              SizedBox(
                width: 8.0,
              ),
              Text("Title", style: TextStyle(fontSize: 16.0))
            ],
          ),
          Text("Date", style: TextStyle(fontSize: 16.0))
        ],
      ),
    );
  }
}
