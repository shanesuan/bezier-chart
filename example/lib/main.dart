import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  _onTap(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(),
          body: widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("168 Manufacturing History Graph"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Coolant Concentration"),
              subtitle: Text("Sample Graph"),
              onTap: () => _onTap(
                context,
                sample6(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget sample6(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Colors.white,
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Coolant Concentration",
          style: TextStyle(
            color: Colors.blueGrey[700],
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        _buildChart(
          BezierChartScale.WEEKLY,
          context,
          LinearGradient(
            colors: [
              Colors.blue[100],
              Colors.blue[800],
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ],
    ),
  );
}

_buildChart(
    BezierChartScale scale, BuildContext context, LinearGradient gradient) {
  final fromDate = DateTime.now().subtract(Duration(days: 28));
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 0));
  final date2 = DateTime.now().subtract(Duration(days: 1));

  final date3 = DateTime.now().subtract(Duration(days: 2));
  final date4 = DateTime.now().subtract(Duration(days: 3));

  final date5 = DateTime.now().subtract(Duration(days: 4));
  final date6 = DateTime.now().subtract(Duration(days: 5));

  final date7 = DateTime.now().subtract(Duration(days: 6));
  final date8 = DateTime.now().subtract(Duration(days: 7));

  final date9 = DateTime.now().subtract(Duration(days: 8));
  final date10 = DateTime.now().subtract(Duration(days: 9));

  final date11 = DateTime.now().subtract(Duration(days: 10));
  final date12 = DateTime.now().subtract(Duration(days: 11));

  final date13 = DateTime.now().subtract(Duration(days: 12));
  final date14 = DateTime.now().subtract(Duration(days: 13));
  


  return Center(
    child: Card(
      elevation: 10,
      margin: EdgeInsets.all(40.0),
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: scale,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "Coolant %",
              onMissingValue: (dateTime) {
                if (dateTime.year.isEven) {
                  return 0.0;
                }
              },
              data: [
                DataPoint<DateTime>(value: 6, xAxis: date1),
                DataPoint<DateTime>(value: 8, xAxis: date2),
                DataPoint<DateTime>(value: 5, xAxis: date3),
                DataPoint<DateTime>(value: 8, xAxis: date4),
                DataPoint<DateTime>(value: 10, xAxis: date5),
                DataPoint<DateTime>(value: 7, xAxis: date6),
                DataPoint<DateTime>(value: 6, xAxis: date7),
                DataPoint<DateTime>(value: 5, xAxis: date8),
                DataPoint<DateTime>(value: 6, xAxis: date9),
                DataPoint<DateTime>(value: 8, xAxis: date10),
                DataPoint<DateTime>(value: 7, xAxis: date11),
                DataPoint<DateTime>(value: 6, xAxis: date12),
                DataPoint<DateTime>(value: 6, xAxis: date13),
                DataPoint<DateTime>(value: 7, xAxis: date14),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.lightBlue,
            displayYAxis: true,
            stepsYAxis : 5,
            showVerticalIndicator: false,
            verticalIndicatorFixedPosition: false,
            backgroundGradient: gradient,
            footerHeight: 35.0,
          ),
        ),
      ),
    ),
  );
}
