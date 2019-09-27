import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:reminder_app/Spent/AddSpentScreen.dart';
import 'package:reminder_app/WebServices/ApiClient.dart';

class SpentScreen extends StatefulWidget {
  @override
  _SpentScreenState createState() => _SpentScreenState();
}

class _SpentScreenState extends State<SpentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSpentScreen()),
              );
        },
            child: Icon(Icons.add)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PieChart(
              dataMap: _getMapData(),
              //Required parameter
              legendFontColor: Colors.blueGrey[900],
              legendFontSize: 14.0,
              legendFontWeight: FontWeight.w500,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: true,
              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
              showLegends: true,
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child:
                      Text("View More", style: TextStyle(color: Colors.blue))),
            )
          ],
        ),
      ),
    );
  }

  Map _getMapData() {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);

    return dataMap;
  }
}
