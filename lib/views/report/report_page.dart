import 'package:flutter/material.dart';

class MyReportPage extends StatelessWidget {
  const MyReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Row(children: [
          Expanded(
            child: Column(children: [
              Placeholder(fallbackHeight: 200),
              Text('Pie Chart - Revenue'),
            ]),
          ),
          Expanded(
            child: Column(children: [
              Placeholder(fallbackHeight: 200),
              Text('Pie Chart - Stock'),
            ]),
          ),
        ]),
      ),
      Expanded(
        child: Column(children: [
          Placeholder(fallbackHeight: 200),
          Text('Bar Chart - Annual Overview'),
        ]),
      ),
    ]);
  }
}
