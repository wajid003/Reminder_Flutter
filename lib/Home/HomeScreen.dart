
import 'package:flutter/material.dart';
import 'package:reminder_app/Reminder/ReminderScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ReminderScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms),
              title: Text("Reminder")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                title: Text("Spent")
            )
          ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
